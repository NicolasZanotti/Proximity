package proximity.model
{
	import Box2D.Common.Math.b2Vec2;
	import proximity.entities.GameEntity;
	import proximity.utilities.CachedDistance;


	/**
	 * @author Nicolas Zanotti
	 */
	public class GameplayState
	{
		/**
		 * The amount of black holes currently on the map
		 */
		public var blackHoleCount:uint = 0;
		public var blackHoleExistanceFrames:uint = 0;
		public var blackHoleMass:Number = .5;
		public var pullForce:Number;
		public var pullAngle:Number;
		public var pullVelocity:b2Vec2 = new b2Vec2();
		
		/**
		 * The amount of Magnets a player is allowed to place in a level
		 */
		public var allowedBlackHoles:int = 1;
		public var distanceToBlackHole:CachedDistance = new CachedDistance();
		public var currentDistance:Number;
		
		/**
		 * Pulled items eventually also get sucked into the black hole.
		 */
	//	public var currentPullableEntities:Vector.<GameEntity>;
		
		
		public var currentEntities:Vector.<GameEntity>;
		
		/**
		 * Items that can get sucked but not pulled into the black hole.
		 */
		//public var currentNonPullableEntities:Vector.<GameEntity>;
		
		/**
		 * The amount of harmful items in the level
		 */
		 public var totalHarmfulItems:int = 0;
		 
		 /**
		  * The amount of translucent items in the level
		  */
		  public var totalTranslucentItems:int = 0;
	}
}