package proximity.entities
{
	import net.box2fp.Box2DWorld;

	/**
	 * @author Nicolas Zanotti
	 */
	public class Boundries
	{
		public var top:BoundryBox;
		public var right:BoundryBox;
		public var bottom:BoundryBox;
		public var left:BoundryBox;
		private var world:Box2DWorld;

		public function Boundries(world:Box2DWorld, width:Number, height:Number, thickness:Number = 10)
		{
			this.world = world;
			top = world.add(new BoundryBox("TopBoundry", 0, 0, width - thickness, thickness)) as BoundryBox;
			right = world.add(new BoundryBox("RightBoundry", width - thickness, 0, thickness, height - thickness)) as BoundryBox;
			bottom = world.add(new BoundryBox("BottomBoundry", thickness, height - thickness, width - thickness, thickness)) as BoundryBox;
			left = world.add(new BoundryBox("LeftBoundry", 0, thickness, thickness, height - thickness)) as BoundryBox;
		}

		public function removeAll():void
		{
			top.remove();
			right.remove();
			bottom.remove();
			left.remove();
		}
	}
}