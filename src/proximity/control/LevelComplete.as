package proximity.control
{
	import proximity.model.ApplicationState;

	import stoletheshow.core.IControllable;

	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author Nicolas Zanotti
	 */
	public class LevelComplete extends MovieClip implements IControllable
	{
		public var ct:LinkedController;
		public var btNext:SimpleButton;

		public function LevelComplete()
		{
			ct = new LinkedController(this);
		}

		// ---------------------------------------------------------------------
		// Event Handlers
		// ---------------------------------------------------------------------
		private function onNextClick(event:Event):void
		{
			event.stopPropagation();
			ct.main.state = ApplicationState.GAME;
		}

		// ---------------------------------------------------------------------
		// Controller Methods
		// ---------------------------------------------------------------------
		public function init():void
		{
			ct.events.add(btNext, MouseEvent.CLICK, onNextClick);
			ct.locator.sounds.victory.play();
		}

		public function dispose():void
		{
		}
	}
}