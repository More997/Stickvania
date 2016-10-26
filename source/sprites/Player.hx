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
		animation.add("caminaD", [1, 2, 3, 4, 5, 6], 5, true);
		animation.add("caminaI", [1, 2, 3, 4, 5, 6], 5, true, true);
		animation.add("quieto", [0], 1);
		acceleration.y = Reg.vAccel;
	}
	override public function update(elapsed:Float):Void
	{		
		if (isTouching(FlxObject.FLOOR))
			velocity.x = 0;
		if (FlxG.keys.justPressed.W && isTouching(FlxObject.FLOOR))
			velocity.y = Reg.vSpeed;
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
			if (FlxG.keys.justReleased.A || FlxG.keys.justReleased.D)
			animation.play("quieto");

			
		super.update(elapsed);
	}
	
}