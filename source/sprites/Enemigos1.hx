package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.math.FlxPoint;
/**
 * ...
 * @author ...
 */
class Enemigos1 extends FlxSprite
{
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		scale.set(2, 2);
		setSize(32, 32);
		centerOffsets();
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
		if (x > FlxG.camera.scroll.x + FlxG.camera.width || x < FlxG.camera.scroll.x && this.alive)
			kill();
		else if(x < FlxG.camera.scroll.x && x < FlxG.camera.scroll.x + FlxG.camera.width)
		{
			if (!this.alive)
				revive();
		}
		trace("x", x);
		trace("camara scroll x", FlxG.camera.scroll.x);
		trace("y", y);
	}
	
}