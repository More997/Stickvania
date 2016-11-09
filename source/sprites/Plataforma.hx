package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author matias
 */
class Plataforma extends FlxSprite
{
	private var posIX:Float;
	private var speed:Float = 15;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		posIX = x;
		velocity.x = -speed;
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (x < posIX - 30)
			velocity.x = speed;
		else if (x > posIX +30)
			velocity.x = -speed;
		
	}
	
}