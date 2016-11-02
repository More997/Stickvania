package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Enemigos extends FlxSprite
	{	private var der:Float = 200 + 10;
	    private var izq:Float = 200 - 10;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.E1__png, true, 16, 16);
		scale.set(2, 2);
		animation.add("caminaI", [0,1], 3, true);
		animation.add("caminaD", [0,1], 3, true, true);
		animation.play("caminaI");
		velocity.x = -10;
		acceleration.y = Reg.vAccel;
		if (x == der) {
		x -= 10;
		animation.play("caminaI");
		velocity.x = -10;
		}
		else if (x == izq) {
		x += 10;
		animation.play("caminaD");
		velocity.x = 10;
		}
		
	}
	
}