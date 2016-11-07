package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
/**
 * ...
 * @author ...
 */
class Lazo extends FlxSprite
{
	private var mov:Float = 6;
	private var dead:Bool = false;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.Lazo__png, true, 32, 32);
		animation.add("attack", [2], 1);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		//velocity.x += mov;
		if (!animation.finished)
		{
			animation.stop();
			kill();
		}
	}
	
}