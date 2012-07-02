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
	public class GameComplete extends MovieClip implements IControllable
	{
		public var ct:LinkedController;
		public var btHome:SimpleButton;
		public var message:MovieClip;

		public function GameComplete()
		{
			ct = new LinkedController(this);
		}

		// ---------------------------------------------------------------------
		// Event Handlers
		// ---------------------------------------------------------------------
		private function onHomeClick(event:Event):void
		{
			event.stopPropagation();
			ct.locator.appState.currentLevel = 1;
			ct.main.state = ApplicationState.HOME;
		}

		// ---------------------------------------------------------------------
		// Controller Methods
		// ---------------------------------------------------------------------
		public function init():void
		{
			ct.events.add(btHome, MouseEvent.CLICK, onHomeClick);
			
			// Configure sound
			ct.locator.sounds.music.play();
		}

		public function dispose():void
		{
		}
	}
}