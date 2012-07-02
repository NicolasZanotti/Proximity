package proximity.entities
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;

	import flash.display.BitmapData;
	import flash.utils.getDefinitionByName;

	/**
	 * @author Nicolas Zanotti
	 */
	public class Background extends Entity
	{
		public function Background()
		{
			var backdrop:Backdrop = new Backdrop(new (getDefinitionByName("background.png") as Class)(0, 0) as BitmapData);
			graphic = backdrop;
		}
	}
}