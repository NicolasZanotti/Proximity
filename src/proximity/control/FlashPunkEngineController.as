package proximity.control
{
	import proximity.model.Locator;

	import stoletheshow.core.IControllable;

	import flash.events.Event;

	/**
	 * A Controller for classes that extend the Flashpunk Engine.
	 * 
	 * Note: The ADDED_TO_STAGE event clashes with DisplayListControllers.
	 *
	 * @author Nicolas Zanotti
	 */
	public class FlashPunkEngineController
	{
		private var _o:IControllable;

		public function FlashPunkEngineController(owner:IControllable)
		{
			_o = owner;
			_o.addEventListener(Event.REMOVED_FROM_STAGE, onRemoved, false, 0, true);
		}

		protected function onRemoved(e:Event):void
		{
			e.stopPropagation();
			_o.removeEventListener(Event.REMOVED_FROM_STAGE, onRemoved, false);
			_o.dispose();
			_o = null;
		}

		public function get main():Main
		{
			return owner.root as Main;
		}

		public function get locator():Locator
		{
			return main.locator;
		}

		public function get owner():IControllable
		{
			return _o;
		}
	}
}