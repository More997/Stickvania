package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import sprites.Enemigos;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import sprites.Player;

class MenuState extends FlxState
{
	private var personaje:Player;
	private var enemigo1:Enemigos;
	private var _Suelo:FlxTilemap;
	private var _Fondo:FlxTilemap;
	private var _Load:FlxOgmoLoader;
	
	
	override public function create():Void
	{
		super.create();
		FlxG.mouse.visible = false;
		_Load = new FlxOgmoLoader(AssetPaths.Caste__oel);
		_Fondo = _Load.loadTilemap(AssetPaths.fondo_castle__png, 64,240, "fondo");
		_Suelo = _Load.loadTilemap(AssetPaths.suelo__png, 16, 16, "suelo");
		_Suelo.immovable = true;
		personaje = new Player(100, 100);
		enemigo1 = new Enemigos(200, 100);
		add(_Fondo);
		add(_Suelo);
		add(personaje);
		add(enemigo1);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(_Suelo, personaje);
		FlxG.collide(_Suelo, enemigo1);
	}
}
