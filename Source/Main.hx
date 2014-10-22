package;

import openfl.display.Sprite;
import openfl.Lib;
import openfl.events.MouseEvent;

class Main extends Sprite
{    
	public var drag:Bool;
	public var offsetX:Int;
	public var offsetY:Int;
	public var winX:Int;
	public var winY:Int;

	public function new() 
	{
		super();

		winX = 0;
		winY = 0;

		Lib.current.stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
		Lib.current.stage.addEventListener(MouseEvent.MOUSE_UP, mouseUp);
		Lib.current.stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMove);
	}

	function mouseDown(event:MouseEvent)
	{
		offsetX = Std.int(event.localX);
		offsetY = Std.int(event.localY);
		drag = true;
	}

	function mouseUp(event:MouseEvent)
	{
		drag = false;
	}

	function mouseMove(event:MouseEvent)
	{
		if (drag)
		{
			winX = winX + Std.int(event.localX) - offsetX;
			winY = winY + Std.int(event.localY) - offsetY;

			Lib.application.window.move(winX, winY);
		}
	}
}
