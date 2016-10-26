package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import sprites.Player;

class MenuState extends FlxState
{
	private var personaje:Player;
	private var platform:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		FlxG.mouse.visible = false;
		
		platform = new FlxSprite(0, 200);
		platform.makeGraphic(FlxG.width, 32, 0xFF00FFFF);
		platform.immovable = true;
		
		personaje = new Player(100, 100);
		
		add(platform);
		add(personaje);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(platform, personaje);
	}
}
