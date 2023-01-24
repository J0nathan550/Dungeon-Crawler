package;

import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.FlxState;

class MenuState extends FlxState
{
	var playButton:FlxButton;

	override public function create()
	{
		playButton = new FlxButton(0, 0, "Play", clickPlay);
		playButton.screenCenter();
		add(playButton);
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	private function clickPlay() {
        FlxG.switchState(new PlayState());
    }
}
