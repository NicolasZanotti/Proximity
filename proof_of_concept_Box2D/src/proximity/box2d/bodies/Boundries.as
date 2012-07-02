package proximity.box2d.bodies
{
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;
	import proximity.box2d.math.pixelsToMeters;

	/**
	 * @author Nicolas Schudel
	 */
	public class Boundries
	{
		private var _world:b2World;

		public function Boundries(world:b2World)
		{
			_world = world;
		}

		public function create(width:Number, height:Number, thickness:Number = 4):void
		{
			var bodyDef:b2BodyDef = new b2BodyDef();
			var body:b2Body;
			var box:b2PolygonShape = new b2PolygonShape();
			var vo:b2FixtureDef = new b2FixtureDef();


			// top
			bodyDef.position.Set(pixelsToMeters((width / 2) + thickness), pixelsToMeters(thickness));
			body = _world.CreateBody(bodyDef);
			box.SetAsBox(pixelsToMeters((width / 2) - thickness), pixelsToMeters(thickness));
			vo = new b2FixtureDef();
			vo.shape = box;
			vo.userData = {};
			vo.userData["name"] = "top";
			body.CreateFixture(vo);
			body.SetUserData(vo.userData);

			// right
			bodyDef.position.Set(pixelsToMeters(width - thickness), pixelsToMeters((height / 2) + thickness));
			body = _world.CreateBody(bodyDef);
			box.SetAsBox(pixelsToMeters(thickness), pixelsToMeters((height / 2) - thickness));
			vo = new b2FixtureDef();
			vo.shape = box;
			vo.userData = {};
			vo.userData["name"] = "right";
			body.CreateFixture(vo);
			body.SetUserData(vo.userData);

			// bottom
			bodyDef.position.Set(pixelsToMeters((width / 2) - thickness), pixelsToMeters(height - thickness));
			body = _world.CreateBody(bodyDef);
			box.SetAsBox(pixelsToMeters((width / 2) - thickness), pixelsToMeters(thickness));
			vo = new b2FixtureDef();
			vo.shape = box;
			vo.userData = {};
			vo.userData["name"] = "bottom";
			body.CreateFixture(vo);
			body.SetUserData(vo.userData);

			// left
			bodyDef.position.Set(pixelsToMeters(thickness), pixelsToMeters((height / 2) - thickness));
			body = _world.CreateBody(bodyDef);
			box.SetAsBox(pixelsToMeters(thickness), pixelsToMeters((height / 2) - thickness));
			vo = new b2FixtureDef();
			vo.shape = box;
			vo.userData = {};
			vo.userData["name"] = "left";
			body.CreateFixture(vo);
			body.SetUserData(vo.userData);
		}
	}
}
