package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/axe.png", "assets/images/axe.png");
			type.set ("assets/images/axe.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/Lazo.png", "assets/images/Lazo.png");
			type.set ("assets/images/Lazo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/stik ata axe.png", "assets/images/stik ata axe.png");
			type.set ("assets/images/stik ata axe.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/stik.png", "assets/images/stik.png");
			type.set ("assets/images/stik.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/stik.psd", "assets/images/stik.psd");
			type.set ("assets/images/stik.psd", Reflect.field (AssetType, "binary".toUpperCase ()));
			path.set ("assets/images/stikjump.png", "assets/images/stikjump.png");
			type.set ("assets/images/stikjump.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/music/Tropical House 1.wav", "assets/music/Tropical House 1.wav");
			type.set ("assets/music/Tropical House 1.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/Nivel/bat.png", "assets/Nivel/bat.png");
			type.set ("assets/Nivel/bat.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/Nivel/Caste.oel", "assets/Nivel/Caste.oel");
			type.set ("assets/Nivel/Caste.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/Nivel/Castle.oep", "assets/Nivel/Castle.oep");
			type.set ("assets/Nivel/Castle.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/Nivel/columnas.png", "assets/Nivel/columnas.png");
			type.set ("assets/Nivel/columnas.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/Nivel/Corazon.png", "assets/Nivel/Corazon.png");
			type.set ("assets/Nivel/Corazon.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/Nivel/E1.png", "assets/Nivel/E1.png");
			type.set ("assets/Nivel/E1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/Nivel/enemigoSoldado.png", "assets/Nivel/enemigoSoldado.png");
			type.set ("assets/Nivel/enemigoSoldado.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/Nivel/escalera.png", "assets/Nivel/escalera.png");
			type.set ("assets/Nivel/escalera.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/Nivel/fondogrande.png", "assets/Nivel/fondogrande.png");
			type.set ("assets/Nivel/fondogrande.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/Nivel/lava.png", "assets/Nivel/lava.png");
			type.set ("assets/Nivel/lava.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/Nivel/Loli.png", "assets/Nivel/Loli.png");
			type.set ("assets/Nivel/Loli.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/Nivel/Lolii.png", "assets/Nivel/Lolii.png");
			type.set ("assets/Nivel/Lolii.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/Nivel/pinches.png", "assets/Nivel/pinches.png");
			type.set ("assets/Nivel/pinches.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/Nivel/plat.png", "assets/Nivel/plat.png");
			type.set ("assets/Nivel/plat.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/Nivel/suelo.png", "assets/Nivel/suelo.png");
			type.set ("assets/Nivel/suelo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/images/logo/default.png", "flixel/images/logo/default.png");
			type.set ("flixel/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
