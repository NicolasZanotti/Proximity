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
	public class LevelFailed extends MovieClip implements IControllable
	{
		public var ct:LinkedController;
		public var message:MovieClip;
		public var btRetry:SimpleButton;

		public function LevelFailed()
		{
			ct = new LinkedController(this);
		}

		// ---------------------------------------------------------------------
		// Event Handlers
		// ---------------------------------------------------------------------
		private function onRetryClick(event:Event):void
		{
			event.stopPropagation();
			ct.main.state = ApplicationState.GAME;
		}

		// ---------------------------------------------------------------------
		// Controller Methods
		// ---------------------------------------------------------------------
		public function init():void
		{
			if (ct.locator.appState.remainingHarmfulItems)
			{
				message.tf.text = "You collected harmful items." + "\n" + "Avoid anything with the color red."
			}
			else if (ct.locator.appState.missedItems == 1)
			{
				message.tf.text = "You missed collecting an item." + "\n" + "Try and get them all."
			}
			else if (ct.locator.appState.missedItems > 1)
			{
				message.tf.text = "You missed collecting " + ct.locator.appState.missedItems + " items." + "\n" + "Try and get them all."
			}

			ct.events.add(btRetry, MouseEvent.CLICK, onRetryClick);

			ct.locator.sounds.defeat.play();
		}

		public function dispose():void
		{
		}
	}
}