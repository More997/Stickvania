package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.FlxObject;
/**
 * ...
 * @author ...
 */
class Player extends FlxSprite
{
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(16, 32);
		acceleration.y = Reg.vAccel;
	}
	override public function update(elapsed:Float):Void
	{		
		if (isTouching(FlxObject.FLOOR))
			velocity.x = 0;
		if (FlxG.keys.justPressed.W && isTouching(FlxObject.FLOOR))
			velocity.y = Reg.vSpeed;
		if (FlxG.keys.pressed.A && isTouching(FlxObject.FLOOR))
			velocity.x -= Reg.hSpeed;
		if (FlxG.keys.pressed.D && isTouching(FlxObject.FLOOR))
			velocity.x += Reg.hSpeed;
			
		super.update(elapsed);
	}
	
}