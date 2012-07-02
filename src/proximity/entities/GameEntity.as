package proximity.entities
{
	import net.box2fp.IBox2DEntity;

	import Box2D.Dynamics.b2Body;

	/**
	 * @author Nicolas Zanotti
	 */
	public interface GameEntity extends IBox2DEntity
	{
		function get body():b2Body;

		/*
		 * If the entity can be sucked into the black hole
		 */
		function get isPullable():Boolean;

		function set isPullable(pullable:Boolean):void;

		/*
		 * If the entity is harmful when collecting.
		 */
		function get isHarmful():Boolean;

		function set isHarmful(harmful:Boolean):void;

		/*
		 * The current frame of the entity removal animation.
		 */
		function get removalAnimationFrame():Number;

		function set removalAnimationFrame(n:Number):void;

		/*
		 * Box2D throws an error if an entity is removed in the same frame.
		 */
		function get removalEminent():Boolean

		function set removalEminent(isEminent:Boolean):void
	}
}