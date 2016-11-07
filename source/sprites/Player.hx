package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.FlxObject;
/**
 * ...
 * @author ...
 */
class Player extends FlxSprite
{	
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.stik__png, true, 24, 46);
		animation.add("caminar", [1, 2, 3, 4, 5], 5, true);
		animation.add("saltar", [14, 15], 4, false);
		animation.add("quieto", [12], 1);
		animation.add("attack", [9, 10, 11], 5, false);
		animation.add("attackUp", [6, 7, 8], 5, false);
		acceleration.y = Reg.vAccel;
	}
	override public function update(elapsed:Float):Void
	{
		if (isTouching(FlxObject.FLOOR))
			velocity.x = 0;
		if (FlxG.keys.justPressed.A && isTouching(FlxObject.FLOOR) && animation.name != "attack" && animation.name != "attackUp")//para que no invierta la animacion en el aire.
			flipX = true;//Si apretas A va a invertir todo el sprite (no hace falta incluir los sprites de izq)
		if (FlxG.keys.justPressed.D && isTouching(FlxObject.FLOOR) && animation.name != "attack" && animation.name != "attackUp")//para que no invierta la animacion en el aire.
			flipX = false;//Necesario para poner el sprite como estaba si es que se apreto A antes.
		if (FlxG.keys.justPressed.W && isTouching(FlxObject.FLOOR) && animation.name != "attack" && animation.name != "attackUp"){
			velocity.y = Reg.vSpeed;}
		if (FlxG.keys.pressed.A && isTouching(FlxObject.FLOOR) && animation.name != "attack" && animation.name != "attackUp")
		{//el personaje no va a poder caminar saltar ni estar en "quieto" mientras este atacando.
			velocity.x -= Reg.hSpeed;
			flipX = true;
			animation.play("caminar");
		}
		if (FlxG.keys.pressed.D && isTouching(FlxObject.FLOOR) && animation.name != "attack" && animation.name != "attackUp")
		{//el personaje no va a poder caminar saltar ni estar en "quieto" mientras este atacando.
			velocity.x += Reg.hSpeed;
			animation.play("caminar");
			flipX = false;
		}
		if (FlxG.keys.pressed.W && !isTouching(FlxObject.FLOOR) && animation.name != "attack" && animation.name != "attackUp")
		{//el personaje no va a poder caminar saltar ni estar en "quieto" mientras este atacando.
			animation.play("saltar");
		}
		if (velocity.x == 0 && isTouching(FlxObject.FLOOR) && animation.name != "attack" && animation.name != "attackUp")
		{//el personaje no va a poder caminar saltar ni estar en "quieto" mientras este atacando.
			animation.play("quieto");
		}
		if (FlxG.keys.justPressed.L)//Atacar/Lazo/Lanzar
		{
			//aca irian mas condicionales con booleanos para cuando tengamos las armas de powerups.
			animation.play("attack");
		}
		if (animation.finished && animation.name == "attack")//Cuando termina la animacion cambia a quieto.
			animation.play("quieto");
		else if (animation.finished && animation.name == "attackUp")//Cuando termina la animacion cambia a quieto.
			animation.play("quieto");
		super.update(elapsed);
	}
	
}