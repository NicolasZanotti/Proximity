package proximity.entities
{
	import net.box2fp.Box2DEntity;
	import net.box2fp.Box2DShapeBuilder;

	/**
	 * @author Nicolas Zanotti
	 */
	public class BoundryBox extends Box2DEntity
	{
		public function BoundryBox(name:String, x:Number = 0, y:Number = 0, w:uint = 1, h:uint = 1, b2Type:int = 0, angle:Number = 0)
		{
			super(x, y, w, h, b2Type);
			this.name = name;
		}

		override public function buildShapes(friction:Number, density:Number, restitution:Number, group:int, category:int, collmask:int):void
		{
			var hw:Number = width / (2.0 * box2dworld.scale);
			var hh:Number = height / (2.0 * box2dworld.scale);
			friction = 1;
			density = 1;

			Box2DShapeBuilder.buildRectangle(body, hw, hh, friction, density, restitution, group, category, collmask);
		}

		override public function toString():String
		{
			return name;
		}
	}
}