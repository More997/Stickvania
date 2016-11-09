package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import sprites.Baba;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import sprites.Lazo;
import sprites.Murcielago;
import sprites.Plataforma;
import sprites.Player;
import sprites.Soldado;

class MenuState extends FlxState
{
	private var personaje:Player;
	private var _Suelo:FlxTilemap;
	private var _Pinches:FlxTilemap;
	//private var _Lava:FlxTilemap;
	private var _Fondo:FlxTilemap;
	private var _Plat:Plataforma;
	private var _Baba:Baba;
	private var _Mur:Murcielago; //Mur-kun presentandose al caso!"
	private var _Babas:FlxTypedGroup<Baba>;
	private var _Sols:FlxTypedGroup<Soldado>;
	private var _Murcielagos:FlxTypedGroup<Murcielago>;
	private var _Plataformas:FlxTypedGroup<Plataforma>;
	private var _Load:FlxOgmoLoader;
	private var _Sol:Soldado;
	private var _Lazo:Lazo;
	
	
	override public function create():Void
	{
		super.create();
		_Babas = new FlxTypedGroup<Baba>();
		_Murcielagos = new FlxTypedGroup<Murcielago>();
		_Plataformas = new FlxTypedGroup<Plataforma>();
		_Sols = new FlxTypedGroup<Soldado>();
		FlxG.mouse.visible = false;
		_Lazo = new Lazo();
		_Load = new FlxOgmoLoader(AssetPaths.Caste__oel);
		_Fondo = _Load.loadTilemap(AssetPaths.fondogrande__png, 75, 480, "fondo");
		_Suelo = _Load.loadTilemap(AssetPaths.suelo__png, 16, 16, "suelo");
		_Pinches = _Load.loadTilemap(AssetPaths.pinches__png, 16, 4, "pinches");
		//_Lava = _Load.loadTilemap(AssetPaths.lava__png, 32, 32, "lava"); //le falta el esoacio vacio.
		_Load.loadEntities(placeEntities, "baba");
		_Load.loadEntities(placeEntities, "mur");
		_Load.loadEntities(placeEntities, "soldado");
		//_Load.loadEntities(placeEntities, "boss");
		_Suelo.immovable = true;
		personaje = new Player(100, 100);
		add(_Fondo);
		add(_Plataformas);
		add(_Suelo);
		add(_Pinches);
		//add(_Lava);
		add(personaje);
		add(_Lazo);
		add(_Babas);
		add(_Murcielagos);
		add(_Sols);
		_Lazo.kill();
		FlxG.worldBounds.set(0, 0, _Fondo.width, _Fondo.height);//setear el tamaño total del nivel con los datos de ogmo.
		FlxG.camera.setScrollBounds(0, _Fondo.width, 0, _Fondo.height);//Rango de movilidad de la camara(Todo el nivel)
		FlxG.camera.follow(personaje);//La camara se centra en el jugador.
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		
		if (personaje.alive)
		{
			if (personaje.animation.frameIndex == 11)
			{
				_Lazo.revive();
				_Lazo.animation.play("attack");
			}
			if (_Lazo.alive)
			{
				posLazo(personaje.x, personaje.y);
			}
			FlxG.collide(_Suelo, personaje);
			enemigosYPlataformasInteracciones();
		}
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
				_Baba = new Baba(x,y-50);
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
				_Mur.scale.set(2, 2);
				_Mur.setSize(26, 14);
				_Mur.centerOffsets();
				_Murcielagos.add(_Mur);
			case "plat":
				_Plat = new Plataforma(x, y);
				_Plat.loadGraphic(AssetPaths.plat__png, false, 16, 4);
				_Plat.scale.set(2, 2);
				_Plat.setSize(32, 8);
				_Plat.centerOffsets();
				_Plat.immovable = true;
				_Plataformas.add(_Plat);
			case "soldado":
				_Sol = new Soldado(x, y);
				_Sol.loadGraphic(AssetPaths.enemigoSoldado__png, true, 24, 46);
				_Sol.animation.add("correI", [0, 1, 2, 3, 4], 5, true);
				_Sol.animation.add("correD", [0, 1, 2, 3, 4], 5, true, true);
				_Sol.animation.play("correI");
				_Sols.add(_Sol);			
		}
	}
	private function enemigosYPlataformasInteracciones()
	{
		for (i in 0..._Babas.length)
		{
			FlxG.collide(_Suelo, _Babas.members[i]);
			if(_Babas.members[i].x < FlxG.camera.scroll.x + FlxG.camera.width && _Babas.members[i].x > FlxG.camera.scroll.x-_Babas.members[i].width)
			{
				if (!_Babas.members[i].alive && !_Babas.members[i].muerto)
					_Babas.members[i].revive();
			}
			else if (_Babas.members[i].x > FlxG.camera.scroll.x + FlxG.camera.width || _Babas.members[i].x < FlxG.camera.scroll.x -_Babas.members[i].width && _Babas.members[i].alive)
				_Babas.members[i].kill();
			if (FlxG.collide(_Lazo, _Babas.members[i]))
			{
				_Babas.members[i].muerto = true;
				_Babas.members[i].destroy();
			}
			
			if (FlxG.overlap(personaje, _Babas.members[i]) && !personaje.invulnerable)
			{
				if (Reg.vida > 0)
					personaje.invulnerable = true;
				Reg.vida -= 1;
			}
		}
		for (i in 0..._Murcielagos.length)
		{
			if(_Murcielagos.members[i].x < FlxG.camera.scroll.x + FlxG.camera.width && _Murcielagos.members[i].x > FlxG.camera.scroll.x-_Murcielagos.members[i].width)
			{
				if (!_Murcielagos.members[i].alive && !_Murcielagos.members[i].muerto)
				_Murcielagos.members[i].revive();
			}
			else if (_Murcielagos.members[i].x > FlxG.camera.scroll.x + FlxG.camera.width || _Murcielagos.members[i].x < FlxG.camera.scroll.x -_Murcielagos.members[i].width && _Murcielagos.members[i].alive)
				_Murcielagos.members[i].kill();
			if (FlxG.collide(_Lazo, _Murcielagos.members[i]))
			{
				_Murcielagos.members[i].muerto = true;
				_Murcielagos.members[i].destroy();
			}
			if (FlxG.overlap(personaje, _Murcielagos.members[i]) && !personaje.invulnerable)
			{
				if (Reg.vida > 0)
					personaje.invulnerable = true;
				Reg.vida -= 1;
			}
		}
		for (i in 0..._Sols.length)
		{
			if(_Sols.members[i].x < FlxG.camera.scroll.x + FlxG.camera.width && _Sols.members[i].x > FlxG.camera.scroll.x-_Sols.members[i].width)
			{
				if (!_Sols.members[i].alive && !_Sols.members[i].muerto)
				_Sols.members[i].revive();
			}
			else if (_Sols.members[i].x > FlxG.camera.scroll.x + FlxG.camera.width || _Sols.members[i].x < FlxG.camera.scroll.x -_Sols.members[i].width && _Sols.members[i].alive)
				_Murcielagos.members[i].kill();
			if (FlxG.collide(_Lazo, _Sols.members[i]))
			{
				_Sols.members[i].muerto = true;
				_Sols.members[i].destroy();
			}
			if (FlxG.overlap(personaje, _Sols.members[i]) && !personaje.invulnerable)
			{
				if (Reg.vida > 0)
					personaje.invulnerable = true;
				Reg.vida -= 1;
			}
		}
		for (i in 0..._Plataformas.length)
		{
			FlxG.collide(personaje, _Plataformas.members[i]);			
		}
		for (i in 0..._Sols.length)
		{
			FlxG.collide(_Suelo, _Sols.members[i]);
			if(_Sols.members[i].x < FlxG.camera.scroll.x + FlxG.camera.width && _Sols.members[i].x > FlxG.camera.scroll.x-_Sols.members[i].width)
			{
				if (!_Sols.members[i].alive && !_Sols.members[i].muerto)
					_Sols.members[i].revive();
			}
			else if (_Sols.members[i].x > FlxG.camera.scroll.x + FlxG.camera.width || _Sols.members[i].x < FlxG.camera.scroll.x -_Sols.members[i].width && _Sols.members[i].alive)
				_Sols.members[i].kill();
			if (FlxG.collide(_Lazo, _Sols.members[i]))
			{
				_Sols.members[i].muerto = true;
				_Sols.members[i].destroy();
			}
		}
	}
}
