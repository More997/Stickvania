package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Murcielago extends FlxSprite
{
	private var posIY:Float;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		posIY = y;
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (y <= posIY && velocity.y < 0)
		{
			velocity.y = 20;
		}
		else if (y > posIY +50 && velocity.y > 0)
			velocity.y = -20;
		if(x > Reg.jugadorPosX){
			velocity.x = -10;
		}
		else
		{
			velocity.x = 10;
		}
	}
	
}