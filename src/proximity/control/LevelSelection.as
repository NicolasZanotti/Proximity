package proximity.control
{
	import flash.display.SimpleButton;

	import proximity.model.ApplicationState;
	import proximity.ui.LevelSelectionButton;

	import stoletheshow.core.IControllable;

	import flash.display.Sprite;
	import flash.events.MouseEvent;

	/**
	 * @author Nicolas Zanotti
	 */
	public class LevelSelection extends Sprite implements IControllable
	{
		public var ct:LinkedController;
		public var btLevel1:LevelSelectionButton, btLevel2:LevelSelectionButton, btLevel3:LevelSelectionButton, btLevel4:LevelSelectionButton, btLevel5:LevelSelectionButton, btLevel6:LevelSelectionButton;

		public function LevelSelection()
		{
			ct = new LinkedController(this);
		}

		// ---------------------------------------------------------------------
		// Controller Methods
		// ---------------------------------------------------------------------
		public function init():void
		{
			// Configure listeners
			ct.events.add(this, MouseEvent.CLICK, onBtLevelClick);

			var buttons:Array = [btLevel1, btLevel2, btLevel3, btLevel4, btLevel5, btLevel6];

			for (var i:int = 0, button:LevelSelectionButton, n:int = buttons.length; i < n; i++)
			{
				button = buttons[i];
				button.tf.text = (i + 1).toString();
				button.active = (i + 1) <= ct.locator.appState.reachedLevel;
			}
		}

		public function dispose():void
		{
		}

		// ---------------------------------------------------------------------
		// Event Handlers
		// ---------------------------------------------------------------------
		private function onBtLevelClick(event:MouseEvent):void
		{
			event.stopPropagation();

			if (event.target is SimpleButton && event.target.parent is LevelSelectionButton)
			{
				ct.locator.appState.currentLevel = uint(event.target.parent.tf.text);
				ct.main.state = ApplicationState.GAME;
			}
		}
	}
}
