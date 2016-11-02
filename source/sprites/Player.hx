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
		loadGraphic(AssetPaths.stik__png, true, 24, 46);
		animation.add("caminaD", [1, 2, 3, 4, 5], 5, true);
		animation.add("caminaI", [1, 2, 3, 4, 5], 5, true, true);
		animation.add("saltaD", [13, 14, 15], 4);
		animation.add("saltaI", [13, 14, 15], 4, false, true);
		animation.add("quieto", [12], 1);
		animation.add("attackD", [9, 10, 11],2);
		animation.add("attackI", [9, 10, 11], 2, false, true);
		animation.add("attackupD", [6, 7, 8], 2);
		acceleration.y = Reg.vAccel;
	}
	override public function update(elapsed:Float):Void
	{		
		if (isTouching(FlxObject.FLOOR))
			velocity.x = 0;
		if (FlxG.keys.justPressed.W && isTouching(FlxObject.FLOOR))
		{
			velocity.y = Reg.vSpeed;
		} 
		if (FlxG.keys.pressed.W && !isTouching(FlxObject.FLOOR))
			{
				if (velocity.x < 0)
					animation.play("saltaI");
				else if (velocity.x >= 0)
					animation.play("saltaD");
			}
		if (FlxG.keys.pressed.A && isTouching(FlxObject.FLOOR))
			{
				velocity.x -= Reg.hSpeed;
				animation.play("caminaI");
			}
			
		if (FlxG.keys.pressed.D && isTouching(FlxObject.FLOOR))
		{
			velocity.x += Reg.hSpeed;
			animation.play("caminaD");
		}
		if (velocity.x == 0 && isTouching(FlxObject.FLOOR))
			animation.play("quieto");

			
		super.update(elapsed);
	}
	
}