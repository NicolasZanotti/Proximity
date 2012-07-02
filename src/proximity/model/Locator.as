package proximity.model
{
	/**
	 * Object Factory for App-wide elements.
	 * @author Nicolas Zanotti
	 */
	public class Locator
	{
		private var _appState:ApplicationState;
		private var _sounds:Sounds;

		public function Locator()
		{
		}

		public function get appState():ApplicationState
		{
			if (_appState == null) _appState = new ApplicationState();
			return _appState;
		}

		public function get sounds():Sounds
		{
			if (_sounds == null) _sounds = new Sounds();
			return _sounds;
		}
	}
}