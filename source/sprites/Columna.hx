package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Columna extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
	}
		override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if(dispara=true){
			animation.play("dispara");
		}
		if (animation.
	}
	
}