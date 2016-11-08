package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import sprites.Enemigos1;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import sprites.Lazo;
import sprites.Player;

class MenuState extends FlxState
{
	private var personaje:Player;
	private var _Suelo:FlxTilemap;
	private var _Fondo:FlxTilemap;
	private var _Plat:FlxTilemap;
	private var _Baba:Enemigos1;
	private var _Load:FlxOgmoLoader;
	private var guiaCamara:FlxSprite;
	private var _Lazo:Lazo;
	
	override public function create():Void
	{
		super.create();
		FlxG.mouse.visible = false;
		_Lazo = new Lazo();
		guiaCamara = new FlxSprite(FlxG.width / 2, FlxG.height / 2);
		_Load = new FlxOgmoLoader(AssetPaths.Caste__oel);
		_Fondo = _Load.loadTilemap(AssetPaths.fondogrande__png, 75, 480, "fondo");
		_Suelo = _Load.loadTilemap(AssetPaths.suelo__png, 16, 16, "suelo");
		_Plat = _Load.loadTilemap(AssetPaths.plat__png, 16, 4, "plat");
		_Load.loadEntities(placeEntities, "baba");
		_Suelo.immovable = true;
		_Plat.immovable = true;
		personaje = new Player(100, 100);
		add(_Fondo);
		add(_Plat);
		add(_Suelo);
		add(personaje);
		add(_Lazo);
		_Lazo.kill();
		FlxG.worldBounds.set(0, 0, _Fondo.width, _Fondo.height);//setear el tamaño total del nivel con los datos de ogmo.
		FlxG.camera.setScrollBounds(0, _Fondo.width, 0, _Fondo.height);//Rango de movilidad de la camara(Todo el nivel)
		FlxG.camera.follow(guiaCamara);//La camara se centra en el jugador.
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
			guiaCamara.x = personaje.x;
			if (personaje.y > _Fondo.height / 2 - 20)
			{
				if(guiaCamara.y < personaje.y)
					guiaCamara.y += 14;
			}
		}
		if (_Lazo.alive)
		{
			posLazo(personaje.x, personaje.y);
			if (FlxG.collide(_Lazo, _Baba))
				_Baba.destroy();
		}
		FlxG.collide(_Suelo, personaje);
		FlxG.collide(_Suelo, _Baba);
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
				_Baba = new Enemigos1(x,y-100);
				_Baba.loadGraphic(AssetPaths.E1__png, true, 16, 16);
				_Baba.animation.add("caminaI", [0,1], 3, true);
				_Baba.animation.add("caminaD", [0,1], 3, true, true);
				_Baba.animation.play("caminaI");
				add(_Baba);
		}
	}
}
