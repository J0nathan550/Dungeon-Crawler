package;

import flixel.FlxState;

class PlayState extends FlxState
{

	override public function create()
	{
		var player = new Player(20, 20);
		add(player);
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
