package proximity.box2d.math
{
	import Box2D.Collision.b2Distance;
	import Box2D.Collision.b2DistanceInput;
	import Box2D.Collision.b2DistanceOutput;
	import Box2D.Collision.b2DistanceProxy;
	import Box2D.Collision.b2SimplexCache;
	import Box2D.Dynamics.b2Body;

	/**
	 * @author Nicolas Zanotti
	 */
	public class CachedDistance
	{
		private var distIn:b2DistanceInput;
		private var distOut:b2DistanceOutput;
		private var cache:b2SimplexCache;

		public function CachedDistance()
		{
			distIn = new b2DistanceInput();
			distOut = new b2DistanceOutput();
			cache = new b2SimplexCache();
			distIn.proxyA = new b2DistanceProxy();
			distIn.proxyB = new b2DistanceProxy();
		}

		public function inMeters(a:b2Body, b:b2Body):Number
		{
			distIn.transformA = a.GetTransform();
			distIn.transformB = b.GetTransform();
			distIn.proxyA.Set(a.GetFixtureList().GetShape());
			distIn.proxyB.Set(b.GetFixtureList().GetShape());

			cache.count = 0;

			b2Distance.Distance(distOut, cache, distIn);

			return distOut.distance;
		}
	}
}