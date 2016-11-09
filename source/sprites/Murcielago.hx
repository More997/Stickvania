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
	public var muerto:Bool = false;
	private var vSpeed:Int = 50;
	private var hSpeed:Int = 15;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		posIY = y;
		velocity.y = vSpeed;
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (y <= posIY && velocity.y < 0)
		{
			velocity.y = vSpeed;
		}
		else if (y > posIY +50 && velocity.y > 0)
			velocity.y = -vSpeed;
		if(x > Reg.jugadorPosX){
			velocity.x = -hSpeed;
		}
		else
		{
			velocity.x = hSpeed;
		}
	}
}