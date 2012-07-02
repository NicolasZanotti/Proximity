package proximity.model
{
	import net.flashpunk.Sfx;

	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.utils.getDefinitionByName;

	/**
	 * @author Nicolas Zanotti
	 */
	public class Sounds
	{
		public var music:Sfx;
		public var ambiance:Sfx;
		public var blackHole:Sfx;
		public var victory:Sfx;
		public var defeat:Sfx;
		private var _currentFadeOut:Sfx;
		private var _fadeTimer:Timer;

		public function Sounds()
		{
			music = new Sfx(getDefinitionByName("airowave.wav"));
			ambiance = new Sfx(getDefinitionByName("rumble.wav"));
			victory = new Sfx(getDefinitionByName("victory.wav"));
			defeat = new Sfx(getDefinitionByName("defeat.wav"));
		}

		public function fadeOut(sfx:Sfx):void
		{
			_currentFadeOut = sfx;
			_fadeTimer = new Timer(250);
			_fadeTimer.addEventListener(TimerEvent.TIMER, onFaderUpdate);
			_fadeTimer.start();
		}

		private function onFaderUpdate(event:Event):void
		{
			if (_currentFadeOut.volume <= 0.05)
			{
				_currentFadeOut.stop();
				_currentFadeOut.volume = 1;

				_fadeTimer.stop();
				_fadeTimer.removeEventListener(TimerEvent.TIMER, onFaderUpdate);
				_fadeTimer = null;
			}
			else
			{
				_currentFadeOut.volume -= 0.05;
			}
		}

		public function stopAll():void
		{
			var allSounds:Array = [music, ambiance, blackHole, victory, defeat];

			for each (var sound:Sfx in allSounds)
			{
				if (sound != null) sound.stop();
			}
		}
	}
}
