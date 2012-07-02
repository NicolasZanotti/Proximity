package proximity.model
{
	/**
	 * Animation constants. Based on 30 frames per second.
	 * 
	 * @author Nicolas Zanotti
	 */
	public class Settings
	{
		/* ------------------------------------------------------------------------------- */
		/*  Game */
		/* ------------------------------------------------------------------------------- */
		public static const START_AT_LEVEL:uint = 1;
		public static const GAME_SCALE:uint = 2;
		public static const TOTAL_LEVELS:uint = 6;
		
		/* ------------------------------------------------------------------------------- */
		/*  Animation */
		/* ------------------------------------------------------------------------------- */
		public static const BLACK_HOLE_EXISTANCE_FRAMES:Number = 101;
		public static const ENTITY_REMOVAL_FRAMES:Number = 6;
		
		/* ------------------------------------------------------------------------------- */
		/*  Physics */
		/* ------------------------------------------------------------------------------- */
		public static const B2_VELOCITY_ITERATIONS:int = 6;
		public static const B2_POSITION_ITERATIONS:int = 2;
		public static const MAX_MASS:Number = 30;
		public static const MAX_FORCE:Number = 20;
		public static const MIN_FORCE:Number = 2;
		
		public static const BOX_FRICTION:Number = 7;
		public static const BOX_DENSITY:Number = 7;
		
		public static const SMALL_BOX_FRICTION:Number = 2;
		public static const SMALL_BOX_DENSITY:Number = 2;		
	}
}