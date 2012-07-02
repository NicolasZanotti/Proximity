package proximity.entities
{
	import Box2D.Dynamics.b2Body;
	import flash.display.BitmapData;
	import flash.utils.getDefinitionByName;
	import net.box2fp.Box2DEntity;
	import net.box2fp.Box2DShapeBuilder;
	import net.box2fp.graphics.SuperGraphiclist;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Spritemap;
	import proximity.utilities.pixelsToMeters;




	/**
	 * @author Nicolas Zanotti
	 */
	public class BlackHole extends Box2DEntity
	{
		private var radius:Number;
		private var spritemap:Spritemap;
		public var sfx:Sfx;

		public function BlackHole(name:String, x:Number = 0, y:Number = 0, radiusInPixels:Number = 5)
		{
			super(x, y, 1, 1, b2Body.b2_staticBody);
			this.radius = radiusInPixels;
			this.name = name;
			setHitbox(width, height);
			type = "magnet";
			
			sfx = new Sfx(getDefinitionByName("black_hole.wav"));

			createBlackHoleAnimation();
		}

		protected function createBlackHoleAnimation():void
		{
			var bmpd:BitmapData = new (getDefinitionByName("black_hole_animation_spritemap.png") as Class)(0, 0) as BitmapData;
			spritemap = new Spritemap(bmpd, 139, 148);
			spritemap.centerOrigin();

			var frames:Array = new Array();
			var n:uint = 101;
			while (n--) frames[n] = n

			spritemap.add("open", frames, 1, false);

			(graphic as SuperGraphiclist).add(spritemap);
			spritemap.play("open")
			sfx.play(1.5);
		}

		override public function buildShapes(friction:Number, density:Number, restitution:Number, group:int, category:int, collmask:int):void
		{
			var r:Number = pixelsToMeters(radius)
			friction = 20;
			density = 20;
			restitution = 0;

			Box2DShapeBuilder.buildCircle(body, r, friction, density, restitution, group, category, collmask);
		}
	}
}