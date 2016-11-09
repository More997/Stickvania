package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import sprites.Enemigos1;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import sprites.Lazo;
import sprites.Murcielago;
import sprites.Player;

class MenuState extends FlxState
{
	private var personaje:Player;
	private var _Suelo:FlxTilemap;
	private var _Fondo:FlxTilemap;
	//private var _Plat:FlxTilemap;
	private var _Baba:Enemigos1;
	private var _Mur:Murcielago; //Mur-kun presentandose al caso!"
	private var _Babas:FlxTypedGroup<Enemigos1>;
	private var _Murcielagos:FlxTypedGroup<Murcielago>;
	private var _Load:FlxOgmoLoader;
	private var _GuiaCamara:FlxSprite;
	private var _Lazo:Lazo;
	
	override public function create():Void
	{
		super.create();
		_Babas = new FlxTypedGroup<Enemigos1>();
		_Murcielagos = new FlxTypedGroup<Murcielago>();
		FlxG.mouse.visible = false;
		_Lazo = new Lazo();
		_GuiaCamara = new FlxSprite(FlxG.width / 2, FlxG.height / 2);
		_Load = new FlxOgmoLoader(AssetPaths.Caste__oel);
		_Fondo = _Load.loadTilemap(AssetPaths.fondogrande__png, 75, 480, "fondo");
		_Suelo = _Load.loadTilemap(AssetPaths.suelo__png, 16, 16, "suelo");
		//_Plat = _Load.loadTilemap(AssetPaths.plat__png, 16, 4, "plat");
		_Load.loadEntities(placeEntities, "baba");
		_Suelo.immovable = true;
		//_Plat.immovable = true;
		personaje = new Player(100, 100);
		add(_Fondo);
		//add(_Plat);
		add(_Suelo);
		add(personaje);
		add(_Lazo);
		add(_Babas);
		add(_Murcielagos);
		_Lazo.kill();
		FlxG.worldBounds.set(0, 0, _Fondo.width, _Fondo.height);//setear el tamaño total del nivel con los datos de ogmo.
		FlxG.camera.setScrollBounds(0, _Fondo.width, 0, _Fondo.height);//Rango de movilidad de la camara(Todo el nivel)
		FlxG.camera.follow(_GuiaCamara);//La camara se centra en el jugador.
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if (personaje.animation.frameIndex == 11)
		{
			_Lazo.revive();
			_Lazo.animation.play("attack");
		}
		if (personaje.alive)
		{
			_GuiaCamara.x = personaje.x;
			if (personaje.y > _Fondo.height / 2 - 20)
			{
				if(_GuiaCamara.y < personaje.y)
					_GuiaCamara.y += 14;
			}
		}
		if (_Lazo.alive)
		{
			posLazo(personaje.x, personaje.y);
		}
		FlxG.collide(_Suelo, personaje);
		enemigosInteracciones();
	}
	public function posLazo(X:Float, Y:Float)
	{
		if (personaje.flipX == true)
		{
			_Lazo.flipX = true;
			_Lazo.x = X-personaje.width-4;
			_Lazo.y = Y + 9;
		}
		else
		{
			_Lazo.flipX = false;
			_Lazo.x = X+personaje.width-4;
			_Lazo.y = Y + 9;
		}
	}
	private function placeEntities(entityName:String, entityData:Xml):Void
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		switch entityName
		{
			case "baba":
				_Baba = new Enemigos1(x,y-50);
				_Baba.loadGraphic(AssetPaths.E1__png, true, 16, 16);
				_Baba.animation.add("caminaI", [0,1], 3, true);
				_Baba.animation.add("caminaD", [0,1], 3, true, true);
				_Baba.animation.play("caminaI");
				_Baba.scale.set(2, 2);
				_Baba.setSize(32, 32);
				_Baba.centerOffsets();
				_Babas.add(_Baba);
			case "mur":
				_Mur = new Murcielago(x, y);
				_Mur.loadGraphic(AssetPaths.bat__png, true, 13, 7);
				_Mur.animation.add("vuela",	[0, 1], 4, true);
				_Mur.animation.play("vuela");
				add(_Murcielagos);
		}
	}
	private function enemigosInteracciones()
	{
		for (i in 0..._Babas.length)
		{
			FlxG.collide(_Suelo, _Babas.members[i]);
			if(_Babas.members[i].x < FlxG.camera.scroll.x + FlxG.camera.width && _Babas.members[i].x > FlxG.camera.scroll.x-_Babas.members[i].width)
			{
				if (!_Babas.members[i].alive)
				_Babas.members[i].revive();
			}
			else if (_Babas.members[i].x > FlxG.camera.scroll.x + FlxG.camera.width || _Babas.members[i].x < FlxG.camera.scroll.x -_Babas.members[i].width && _Babas.members[i].alive)
				_Babas.members[i].kill();
			if (FlxG.collide(_Lazo, _Babas.members[i]))
				_Babas.members[i].destroy();
		}
		/*for (i in 0..._Murcielagos.length)
		{
			if(_Murcielagos.members[i].x < FlxG.camera.scroll.x + FlxG.camera.width && _Murcielagos.members[i].x > FlxG.camera.scroll.x-_Murcielagos.members[i].width)
			{
				if (!_Murcielagos.members[i].alive)
				_Murcielagos.members[i].revive();
			}
			else if (_Murcielagos.members[i].x > FlxG.camera.scroll.x + FlxG.camera.width || _Murcielagos.members[i].x < FlxG.camera.scroll.x -_Murcielagos.members[i].width && _Murcielagos.members[i].alive)
				_Murcielagos.members[i].kill();
			if (FlxG.collide(_Lazo, _Murcielagos.members[i]))
					_Murcielagos.members[i].destroy();
		}*/
	}
}
