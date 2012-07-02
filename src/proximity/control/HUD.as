package proximity.control
{
	import stoletheshow.core.IControllable;

	import flash.display.Sprite;

	/**
	 * @author Nicolas Zanotti
	 */
	public class HUD extends Sprite implements IControllable
	{
		public var ct:LinkedController;

		public function HUD()
		{
			ct = new LinkedController(this);
		}

		// ---------------------------------------------------------------------
		// Controller Methods
		// ---------------------------------------------------------------------
		public function init():void
		{
			ct.locator.appState.gamePaused = false;
			ct.locator.sounds.fadeOut(ct.locator.sounds.music);
			ct.locator.sounds.ambiance.loop(.5);
		}

		public function dispose():void
		{
			ct.locator.appState.gamePaused = true;
		}
	}
}