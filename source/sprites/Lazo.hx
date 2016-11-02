package sprites;

import flixel.FlxSprite;

/**
 * ...
 * @author ...
 */
class Lazo extends FlxSprite
{
	private var personaje:Player;

	public function new() 
	{
		loadGraphic(AssetPaths.Lazo__png, true, 32, 32);
		animation.add("attackD", [0, 1, 2], 2);
		animation.add("attackI", [0, 1, 2], 2, false, true);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (FlxG.keys.p.ressed.L)
		{   if(personaje.velocity.x >=0)
				animation.play("attackD");
			else if (personaje.velocity.x < 0)
				animation.play("attackI");
		}
		
	}
	
}