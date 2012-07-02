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
	public class Obstacle
	{
		private var _world:b2World;
		private var _body:b2Body;

		public function Obstacle(world:b2World)
		{
			_world = world;
		}

		public function create(rectInMeters:Rectangle):Obstacle
		{
			var bodyDef:b2BodyDef = new b2BodyDef();
			bodyDef.type = b2Body.b2_dynamicBody;
			bodyDef.position.Set(rectInMeters.x, rectInMeters.y);
			bodyDef.angle = Math.random() * 100;
			bodyDef.linearDamping = 10;

			_body = _world.CreateBody(bodyDef);

			var box:b2PolygonShape = new b2PolygonShape();
			box.SetAsBox(rectInMeters.width, rectInMeters.height);
			

			var vo:b2FixtureDef = new b2FixtureDef();
			vo.shape = box;
			vo.density = 20;
			vo.friction = 20;
			_body.CreateFixture(vo);

			return this;
		}

		public function withUserData(obj:Object):Obstacle
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