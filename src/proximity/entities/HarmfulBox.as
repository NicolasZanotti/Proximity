package proximity.entities
{
	import Box2D.Dynamics.b2Body;

	import net.box2fp.graphics.SuperGraphiclist;
	import net.box2fp.Box2DEntity;
	import net.box2fp.Box2DShapeBuilder;
	import net.flashpunk.graphics.Image;

	import proximity.model.Settings;

	import flash.display.BitmapData;
	import flash.utils.getDefinitionByName;

	/**
	 * @author Nicolas Zanotti
	 */
	public class HarmfulBox extends Box2DEntity implements GameEntity
	{
		protected var _angle:Number;
		protected var _pullable:Boolean;
		protected var _harmful:Boolean;
		protected var _removalAnimationFrame:Number;
		protected var _removalEminent:Boolean;
		protected var _image:Image;

		public function HarmfulBox(name:String, x:Number = 0, y:Number = 0, angle:Number = 0)
		{
			_image = new Image(new (getDefinitionByName("harmfulbox.png") as Class)(0, 0) as BitmapData);
			_image.centerOrigin();
			_image.scaleX = _image.scaleY = 1;
			_image.x = _image.width * .5;
			_image.y = _image.height * .5;

			super(x, y, _image.width, _image.height, b2Body.b2_dynamicBody);

			this.name = name;
			_angle = angle;
			_pullable = true;
			_harmful = true;
			_removalAnimationFrame = Settings.ENTITY_REMOVAL_FRAMES;
			_removalEminent = false;

			(graphic as SuperGraphiclist).add(_image);
		}

		override public function buildShapes(friction:Number, density:Number, restitution:Number, group:int, category:int, collmask:int):void
		{
			var hw:Number = width / (2.0 * box2dworld.scale);
			var hh:Number = height / (2.0 * box2dworld.scale);
			setHitbox(width, height);
			friction = Settings.BOX_FRICTION;
			density = Settings.BOX_DENSITY;
			restitution = 0;
			angle = _angle;

			Box2DShapeBuilder.buildRectangle(body, hw, hh, friction, density, restitution, group, category, collmask);
		}

		public function get isPullable():Boolean
		{
			return _pullable;
		}

		public function set isPullable(pullable:Boolean):void
		{
			_pullable = pullable;
		}

		override public function toString():String
		{
			return name;
		}

		public function get removalAnimationFrame():Number
		{
			return _removalAnimationFrame;
		}

		public function set removalAnimationFrame(n:Number):void
		{
			if (_image.scaleX > 0.1) _image.scaleX -= 0.16;
			if (_image.scaleY > 0.1) _image.scaleY -= 0.16;

			_removalAnimationFrame = n;
		}

		public function get removalEminent():Boolean
		{
			return _removalEminent;
		}

		public function set removalEminent(isEminent:Boolean):void
		{
			_removalEminent = isEminent;
		}

		public function get isHarmful():Boolean
		{
			return _harmful;
		}

		public function set isHarmful(harmful:Boolean):void
		{
			_harmful = harmful;
		}
	}
}