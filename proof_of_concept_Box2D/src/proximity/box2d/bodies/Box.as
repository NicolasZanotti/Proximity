package proximity.box2d.bodies
{
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;

	import flash.geom.Rectangle;

	/**
	 * @author Nicolas Zanotti
	 */
	public class Box
	{
		private var _world:b2World;
		private var _body:b2Body;

		public function Box(world:b2World)
		{
			_world = world;
		}

		public function create(rectInMeters:Rectangle):Box
		{
			var bodyDef:b2BodyDef = new b2BodyDef();
			bodyDef.type = b2Body.b2_dynamicBody;
			bodyDef.position.Set(rectInMeters.x, rectInMeters.y);
			bodyDef.linearDamping = 2;

			_body = _world.CreateBody(bodyDef);

			var box:b2PolygonShape = new b2PolygonShape();
			box.SetAsBox(rectInMeters.width, rectInMeters.height);

			var vo:b2FixtureDef = new b2FixtureDef();
			vo.shape = box;
			vo.density = 1;
			vo.friction = 1;
			_body.CreateFixture(vo);

			return this;
		}

		public function withUserData(obj:Object):Box
		{
			_body.GetFixtureList().SetUserData(obj);
			_body.SetUserData(obj);

			return this;
		}

		public function get body():b2Body
		{
			return _body;
		}
	}
}