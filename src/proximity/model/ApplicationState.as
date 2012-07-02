package proximity.model
{
	import flash.events.Event;
	import flash.events.EventDispatcher;

	/**
	 * @author Nicolas Zanotti
	 */
	public class ApplicationState extends EventDispatcher
	{
		private var _paused:Boolean = true;
		private var _currentLevel:uint = Settings.START_AT_LEVEL;
		public static const ERROR:String = "ERROR";
		public static const HOME:String = "HOME";
		public static const LEVEL_SELECTION:String = "LEVEL_SELECTION";
		public static const GAME:String = "GAME";
		public static const LEVEL_COMPLETE:String = "LEVEL_COMPLETE";
		public static const LEVEL_FAILED:String = "LEVEL_FAILED";
		public static const GAME_COMPLETE:String = "GAME_COMPLETE";
		public var reachedLevel:uint = Settings.START_AT_LEVEL;
		public var missedItems:int = 0;
		public var remainingHarmfulItems:int = 0;
		public var remainingTranslucentItems:int = 0;

		public function set gamePaused(isPaused:Boolean):void
		{
			_paused = !_paused;
			dispatchEvent(new Event(Event.CHANGE));
		}

		public function get gamePaused():Boolean
		{
			return _paused;
		}

		public function get currentLevel():uint
		{
			return _currentLevel;
		}

		public function set currentLevel(currentLevel:uint):void
		{
			if (currentLevel > reachedLevel) reachedLevel = currentLevel;
			_currentLevel = currentLevel;
		}
	}
}