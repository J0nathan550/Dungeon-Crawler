package;

import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;

class Player extends FlxSprite
{
	static inline var SPEED:Float = 100;

	private var up:Bool = false;
	private var down:Bool = false;
	private var left:Bool = false;
	private var right:Bool = false;

	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);
		makeGraphic(16, 16, FlxColor.BLUE);
		drag.x = drag.y = 800;
	}

	private function updateMovement()
	{
		up = FlxG.keys.anyPressed([UP, W]);
		down = FlxG.keys.anyPressed([DOWN, S]);
		right = FlxG.keys.anyPressed([RIGHT, D]);
		left = FlxG.keys.anyPressed([LEFT, A]);

		if (up && down)
		{
			up = down = false;
		}
		if (left && right)
		{
			left = right = false;
		}

		var newAngle:Float = 0;
		if (up || down || left || right)
		{
			if (up)
			{
				newAngle = -90;
				if (left)
				{
					newAngle -= 45;
				}
				else if (right)
				{
					newAngle += 45;
				}
			}
			else if (down)
			{
				newAngle = 90;
				if (left)
				{
					newAngle += 45;
				}
				else if (right)
				{
					newAngle -= 45;
				}
			}
			else if (left)
			{
				newAngle = 180;
			}
			else if (right)
			{
				newAngle = 0;
			}
			velocity.setPolarDegrees(SPEED, newAngle);
		}
	}

	override function update(elapsed:Float)
	{
		updateMovement();
		super.update(elapsed);
	}
}
