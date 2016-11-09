package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Columna extends FlxSprite
{
	public var dispara:Bool = false;
	public var muerto:Bool = false;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
	}
		override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
			if (Reg.disparan == 0)
		{
			for (i in 0 ... 50)
				Reg.disparan += 1;
		}
		if (Reg.disparan == 50)
		{
			dispara = true;
		}
				if(dispara==true){
				animation.play("dispara");
		}
		if (animation.finished)
		{   
			animation.play("quieto");
			dispara = false;
			Reg.disparan = 0;
		}
	}
	
}