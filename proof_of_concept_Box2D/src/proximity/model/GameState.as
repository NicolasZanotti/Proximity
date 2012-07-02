package proximity.model
{
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import proximity.box2d.math.CachedDistance;



	/**
	 * Holds the game state and its inital values.
	 * 
	 * @author Nicolas Zanotti
	 */
	public class GameState
	{
		public var magnet:b2Body;
		public var magnetMass:Number = 2;
		public var magnetizeForce:Number;
		public var magnetizeAngle:Number;
		public var magnetizeVelocity:b2Vec2 = new b2Vec2();
		public var distanceToMagnet:CachedDistance = new CachedDistance();
		public var uniqueID:Number = 1;
	}
}