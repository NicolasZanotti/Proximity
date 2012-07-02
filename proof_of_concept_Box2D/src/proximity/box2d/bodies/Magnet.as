package proximity.box2d.bodies
{
	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;
	import proximity.box2d.math.pixelsToMeters;


	/**
	 * @author Nicolas Zanotti
	 */
	public class Magnet
	{
		private var _world:b2World;
		private var _body:b2Body;

		public function Magnet(world:b2World)
		{
			_world = world;
		}

		public function create(x:Number, y:Number):Magnet
		{
			var bodyDef:b2BodyDef = new b2BodyDef();
			bodyDef.type = b2Body.b2_staticBody;
			bodyDef.position.Set(pixelsToMeters(x), pixelsToMeters(y));

			_body = _world.CreateBody(bodyDef);

			var circle:b2CircleShape = new b2CircleShape();
			circle.SetRadius(1);

			var vo:b2FixtureDef = new b2FixtureDef();
			vo.shape = circle;
			vo.density = 1;
			vo.friction = 5;
			_body.CreateFixture(vo);

			return this;
		}

		public function withUserData(obj:Object):Magnet
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
