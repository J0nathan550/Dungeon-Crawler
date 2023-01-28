package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmo3Loader;
import flixel.tile.FlxTilemap;

class PlayState extends FlxState
{
	private var map:FlxOgmo3Loader;
	private var walls:FlxTilemap;
	private var player:Player;

	override public function create()
	{
		map = new FlxOgmo3Loader(AssetPaths.dungeon_crawler__ogmo, AssetPaths.level_0__json);
		walls = map.loadTilemap(AssetPaths.tiles__png, "walls");
		walls.follow();
		walls.setTileProperties(1, NONE);
		walls.setTileProperties(2, ANY);
		add(walls);

		player = new Player();
		map.loadEntities(placeEntities, "entities");
		add(player);
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		FlxG.collide(player, walls);
	}

	private function placeEntities(entity:EntityData)
	{
		if (entity.name == "player")
		{
			player.setPosition(entity.x, entity.y);
		}
	}
}
