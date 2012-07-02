package proximity.control
{
	import proximity.model.Locator;
	import stoletheshow.control.EventsController;
	import stoletheshow.core.IControllable;


	/**
	 * Add any application wide functions here.
	 *
	 * @author Nicolas Zanotti
	 */
	public class LinkedController extends EventsController
	{
		public function LinkedController(owner : IControllable)
		{
			super(owner);
		}

		public function get main() : Main
		{
			return owner.root as Main;
		}

		public function get locator() : Locator
		{
			return main.locator;
		}
	}
}