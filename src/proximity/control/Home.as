package proximity.control
{
	import proximity.model.ApplicationState;

	import stoletheshow.core.IControllable;

	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	/**
	 * @author Nicolas Zanotti
	 */
	public class Home extends Sprite implements IControllable
	{
		public var ct:LinkedController;
		public var btStart:SimpleButton;
		public var btQuit:SimpleButton;
		public var mcQuit:Sprite;

		public function Home()
		{
			ct = new LinkedController(this);
		}

		// ---------------------------------------------------------------------
		// Event Handlers
		// ---------------------------------------------------------------------
		private function onBtstartClick(event:MouseEvent):void
		{
			event.stopPropagation();
			ct.main.state = (ct.locator.appState.currentLevel == 1) ? ApplicationState.LEVEL_SELECTION : ApplicationState.GAME;
		}

		private function onBtquitClick(event:MouseEvent):void
		{
			event.stopPropagation();

			CONFIG::MOBILE
			{
				import flash.desktop.NativeApplication;

				NativeApplication.nativeApplication.exit()
			}
		}

		// ---------------------------------------------------------------------
		// Controller Methods
		// ---------------------------------------------------------------------
		public function init():void
		{
			// Configure listeners
			ct.events.add(btStart, MouseEvent.CLICK, onBtstartClick);
			btQuit.visible = mcQuit.visible = false;

			CONFIG::MOBILE
			{
				btQuit.visible = mcQuit.visible = true;
				ct.events.add(btQuit, MouseEvent.CLICK, onBtquitClick);
			}

			CONFIG::DEBUG
			{
				ct.main.state = ApplicationState.GAME;
				return;
			}

			// Configure sound
			ct.locator.sounds.ambiance.stop();
			if (!ct.locator.sounds.music.playing) ct.locator.sounds.music.play();
		}

		public function dispose():void
		{
		}
	}
}