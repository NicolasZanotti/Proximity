package proximity.utilities
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
		private var _distIn:b2DistanceInput;
		private var _distOut:b2DistanceOutput;
		private var _cache:b2SimplexCache;
		private var _aMass:Number;
		private var _bMass:Number;

		public function CachedDistance()
		{
			_distIn = new b2DistanceInput();
			_distOut = new b2DistanceOutput();
			_cache = new b2SimplexCache();
			_distIn.proxyA = new b2DistanceProxy();
			_distIn.proxyB = new b2DistanceProxy();
		}

		public function inMeters(a:b2Body, b:b2Body):Number
		{
			_aMass = a.GetMass();
			_bMass = b.GetMass();

			_distIn.transformA = a.GetTransform();
			_distIn.transformB = b.GetTransform();
			_distIn.proxyA.Set(a.GetFixtureList().GetShape());
			_distIn.proxyB.Set(b.GetFixtureList().GetShape());

			_cache.count = 0;

			b2Distance.Distance(_distOut, _cache, _distIn);

			return _distOut.distance;
		}
	}
}