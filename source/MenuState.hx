package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import sprites.Enemigos;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import sprites.Lazo;
import sprites.Player;

class MenuState extends FlxState
{
	private var personaje:Player;
	private var enemigo1:Enemigos;
	private var _Suelo:FlxTilemap;
	private var _Fondo:FlxTilemap;
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
		_Fondo = _Load.loadTilemap(AssetPaths.fondogrande__png, 75,240, "fondo");
		_Suelo = _Load.loadTilemap(AssetPaths.suelo__png, 16, 16, "suelo");
		_Suelo.immovable = true;
		personaje = new Player(100, 100);
		enemigo1 = new Enemigos(200, 100);
		add(_Fondo);
		add(_Suelo);
		add(personaje);
		add(_Lazo);
		_Lazo.kill();
		add(enemigo1);
		FlxG.camera.setScrollBounds(0, _Fondo.width, 0, _Fondo.height);//Rango de movilidad de la camara(Todo el nivel)
		FlxG.worldBounds.set(0, 0, _Fondo.width, _Fondo.height);//setear el tamaño total del nivel con los datos de ogmo.
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
			guiaCamara.x = personaje.x;
		if (_Lazo.alive)
		{
			posLazo(personaje.x, personaje.y);
			if (FlxG.collide(_Lazo, enemigo1))
				enemigo1.destroy();
		}
		FlxG.collide(_Suelo, personaje);
		FlxG.collide(_Suelo, enemigo1);
	}
	public function posLazo(X:Float, Y:Float) {
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
}
