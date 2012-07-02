package proximity.levels
{
	import Box2D.Common.Math.b2Vec2;

	import net.box2fp.Box2DEntity;
	import net.box2fp.Box2DWorld;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;

	import proximity.entities.BlackHole;
	import proximity.entities.Boundries;
	import proximity.entities.GameEntity;

	/**
	 * @author Nicolas Zanotti
	 */
	public class AbstractLevel extends Box2DWorld
	{
		public var blackHole:BlackHole;
		public var boundries:Boundries;

		public function AbstractLevel()
		{
			super();
			setGravity(new b2Vec2(0, 0));

			CONFIG::DEBUG
			{
				doDebug();
			}
		}

		override public function begin():void
		{
			boundries = new Boundries(this, FP.width, FP.height, 4);
		}

		override public function removeAll():void
		{
			trace("removing all");
			super.removeAll();
			boundries.removeAll()
		}

		/* ------------------------------------------------------------------------------- */
		/*  Helper methods */
		/* ------------------------------------------------------------------------------- */
		public function addBlackHole(name:String, x:Number, y:Number):void
		{
			removeBlackHole();
			blackHole = new BlackHole(name, x, y);
			blackHole.layer = 99;
			add(blackHole);
		}

		public function removeBlackHole():void
		{
			if (hasBlackHole)
			{
				trace("removing black hole");
				blackHole.remove();
			}
		}

		public function removeGameEntity(entity:GameEntity):void
		{
			(entity as Box2DEntity).remove();
		}

		public function removeAllGameEntities():void
		{
			var all:Vector.<Entity> = new Vector.<Entity>();
			getAll(all);

			for (var i:int = 0, n:int = all.length, entity:Entity; i < n; i++)
			{
				entity = all[i];
				if (entity is GameEntity) (entity as Box2DEntity).remove();
			}
		}

		/* ------------------------------------------------------------------------------- */
		/*  Getters and Setters */
		/* ------------------------------------------------------------------------------- */
		public function get hasBlackHole():Boolean
		{
			return blackHole != null && getInstance(blackHole.name);
		}

		public function get allGameEntities():Vector.<GameEntity>
		{
			var all:Vector.<Entity> = new Vector.<Entity>();
			var entities:Vector.<GameEntity> = new Vector.<GameEntity>();

			getAll(all);

			for (var i:int = 0, n:int = all.length, entity:Entity; i < n; i++)
			{
				entity = all[i];
				if (entity is GameEntity) entities.push(entity);
			}

			return entities;
		}

		/**
		 * Items that can be pulled and sucked into the black hole.
		 */
		public function get pullableEntities():Vector.<GameEntity>
		{
			var all:Vector.<Entity> = new Vector.<Entity>();
			var entities:Vector.<GameEntity> = new Vector.<GameEntity>();

			getAll(all);

			for (var i:int = 0, n:int = all.length, entity:Entity; i < n; i++)
			{
				entity = all[i];

				if (entity is GameEntity && (entity as GameEntity).isPullable)
				{
					trace(entity + " is pullable");
					entities.push(entity);
				}
			}

			return entities;
		}

		/**
		 * Items that can only be sucked into the black hole.
		 */
		public function get nonPullableEntitiesAmount():int
		{
			var all:Vector.<Entity> = new Vector.<Entity>();
			var amount:int = 0;

			getAll(all);

			for (var i:int = 0, n:int = all.length, entity:Entity; i < n; i++)
			{
				entity = all[i];
				if (entity is GameEntity && !(entity as GameEntity).isPullable) amount++;
			}

			return amount;
		}

		public function get harmfulEntitiesAmount():int
		{
			var all:Vector.<Entity> = new Vector.<Entity>();
			var amount:int = 0;

			getAll(all);

			for (var i:int = 0, n:int = all.length, entity:Entity; i < n; i++)
			{
				entity = all[i];
				if (entity is GameEntity && (entity as GameEntity).isHarmful) amount++
			}

			return amount;
		}
	}
}
