package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Loli extends FlxSprite
{
	public var muerto:Bool = false;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		switch(FlxG.random.int(1, 3))
			case 1: 
				animation.play("ataque1");
			case 2:
				animation.play("ataque2");
			case 3:
				animation.play("ataque3");
	}
	
}