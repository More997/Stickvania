package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.math.FlxPoint;
/**
 * ...
 * @author ...
 */
class Baba extends FlxSprite
{
	public var muerto:Bool = false;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		acceleration.y = Reg.vAccel;
		
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if(x > Reg.jugadorPosX){
			animation.play("caminaI");
			velocity.x = -10;
		}
		else
		{
			animation.play("caminaD");
			velocity.x = 10;
		}
	}
	
}