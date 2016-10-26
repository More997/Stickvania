package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Enemigos extends FlxSprite
	{	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.E1__png, true, 16, 16);
		scale.set(2, 2);
		animation.add("mov", [0, 1], 4, true);
		animation.play("mov");
		acceleration.y = Reg.vAccel;
	}
	
}