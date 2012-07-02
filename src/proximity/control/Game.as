package proximity.control
{
	import net.box2fp.Box2DWorld;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;

	import proximity.entities.GameEntity;
	import proximity.levels.AbstractLevel;
	import proximity.levels.Level1;
	import proximity.levels.Level2;
	import proximity.levels.Level3;
	import proximity.levels.Level4;
	import proximity.levels.Level5;
	import proximity.levels.Level6;
	import proximity.model.ApplicationState;
	import proximity.model.GameplayState;
	import proximity.model.Settings;

	import stoletheshow.core.IControllable;

	import flash.events.Event;
	import flash.utils.setTimeout;

	public class Game extends Engine implements IControllable
	{
		public var ct:FlashPunkEngineController;
		private var _state:GameplayState;
		private var _world:AbstractLevel;

		public function Game()
		{
			ct = new FlashPunkEngineController(this);
			super(stage.stageWidth, stage.stageHeight, Box2DWorld.DEFAULT_FRAMERATE, true);
		}

		/* ------------------------------------------------------------------------------- */
		/*  Controller methods */
		/* ------------------------------------------------------------------------------- */
		override public function init():void
		{
			trace("Game init")

			// Configure components
			FP.screen.scale = Settings.GAME_SCALE;

			CONFIG::DEBUG
			{
				FP.console.enable();
			}

			paused = true;

			// Configure listeners
			ct.locator.appState.addEventListener(Event.CHANGE, onAppStateChange);
		}

		public function dispose():void
		{
			_state = null;
			_world.pause();
			_world = null;
		}

		/* ------------------------------------------------------------------------------- */
		/*  Application Events */
		/* ------------------------------------------------------------------------------- */
		private function onAppStateChange(event:Event):void
		{
			trace("onAppStateChange: " + ct.locator.appState.gamePaused)

			if (!ct.locator.appState.gamePaused)
			{
				onNextLevel();
				stage.focus = stage;
			}

			paused = ct.locator.appState.gamePaused;
		}

		/* ------------------------------------------------------------------------------- */
		/*  Game loop and user input methods */
		/* ------------------------------------------------------------------------------- */
		override public function update():void
		{
			if (Input.mousePressed)
			{
				trace('_state.allowedBlackHoles: ' + (_state.allowedBlackHoles));
				if (_state.allowedBlackHoles)
				{
					trace("adding black hole");
					_world.addBlackHole("Magnet" + _state.blackHoleCount++, Input.mouseX, Input.mouseY);

					trace("updating allowed black holes")
					_state.allowedBlackHoles -= 1;

					trace("updating entities");
					_state.currentEntities = _world.allGameEntities;

					trace("reseting black hole timer")
					_state.blackHoleExistanceFrames = Settings.BLACK_HOLE_EXISTANCE_FRAMES;
				}
			}

			// Check the distances then pull
			if (_world.hasBlackHole)
			{
				_state.blackHoleExistanceFrames -= 1;

				if (_state.blackHoleExistanceFrames > 0)
				{
					for each (var entity:GameEntity in _state.currentEntities)
					{
						_state.currentDistance = entity.removalEminent ? 0 : _state.distanceToBlackHole.inMeters(_world.blackHole.body, entity.body)

						if (_state.currentDistance < _world.blackHole.width) updateRemovalAnimation(entity);

						if (entity.isPullable) pull(entity, _state.currentDistance);
					}
				}
				else
				{
					_world.removeBlackHole();

					onLevelEnd();
				}
			}

			super.update();
		}

		private function updateRemovalAnimation(entity:GameEntity):void
		{
			if (entity.removalAnimationFrame)
			{
				entity.removalAnimationFrame -= 1;
			}
			else
			{
				entity.removalEminent = true;
				_world.removeGameEntity(entity)
				_state.currentEntities = _world.allGameEntities;
			}
		}

		private function pull(entity:GameEntity, currentDistance:Number):void
		{
			// currentDistance is already calculated outside the funtion -> _state.distanceToBlackHole.inMeters(_world.blackHole.body, entity.body)

			_state.pullForce = _state.blackHoleMass * (Settings.MAX_MASS - entity.body.GetMass()) / currentDistance;
			if (_state.pullForce < Settings.MIN_FORCE) return;
			if (_state.pullForce > Settings.MAX_FORCE) _state.pullForce = Settings.MAX_FORCE;

			_state.pullAngle = Math.atan2(_world.blackHole.body.GetPosition().y - entity.body.GetPosition().y, _world.blackHole.body.GetPosition().x - entity.body.GetPosition().x);
			_state.pullVelocity.x = _state.pullForce * Math.cos(_state.pullAngle);
			_state.pullVelocity.y = _state.pullForce * Math.sin(_state.pullAngle);

			entity.body.SetAwake(true);
			entity.body.SetLinearVelocity(_state.pullVelocity);
			entity.update();
		}

		/* ------------------------------------------------------------------------------- */
		/*  Game Events */
		/* ------------------------------------------------------------------------------- */
		private function onLevelEnd():void
		{
			var appState:ApplicationState = ct.locator.appState;

			// Check for harmful items
			appState.remainingHarmfulItems = _state.totalHarmfulItems - _world.harmfulEntitiesAmount;
			trace('remainingHarmfulItems: ' + (appState.remainingHarmfulItems));

			// Check for translucent items
			appState.remainingTranslucentItems = _world.nonPullableEntitiesAmount;
			trace('remainingTranslucentItems: ' + (appState.remainingTranslucentItems));

			// Check for missed items
			appState.missedItems = _world.pullableEntities.length + appState.remainingTranslucentItems - _state.totalHarmfulItems;
			trace('missedItems: ' + (appState.missedItems));

			// Change state
			if (appState.remainingHarmfulItems || appState.missedItems > 0)
			{
				setTimeout(onLevelFailed, 1500);
			}
			else
			{
				setTimeout(onLevelCompleted, 1500);
			}
		}

		private function onLevelFailed():void
		{
			ct.main.state = ApplicationState.LEVEL_FAILED;
		}

		private function onGameComplete():void
		{
			ct.main.state = ApplicationState.GAME_COMPLETE
		}

		private function onLevelCompleted():void
		{
			ct.locator.appState.currentLevel++;

			if (ct.locator.appState.currentLevel > Settings.TOTAL_LEVELS)
			{
				_world.removeAllGameEntities();
				setTimeout(onGameComplete, 800);
			}
			else
			{
				ct.main.state = ApplicationState.LEVEL_COMPLETE;
			}
		}

		private function onNextLevel():void
		{
			if (_world != null && !_world.paused) _world.pause();

			trace('onNextLevel current level is: ' + (ct.locator.appState.currentLevel));

			// TODO save current level to disk here

			_state = new GameplayState()
			switch(ct.locator.appState.currentLevel)
			{
				case 1:
					FP.world = _world = new Level1(_state);
					break;
				case 2:
					FP.world = _world = new Level2(_state);
					break;
				case 3:
					FP.world = _world = new Level3(_state);
					break;
				case 4:
					FP.world = _world = new Level4(_state);
					break;
				case 5:
					FP.world = _world = new Level5(_state);
					break;
				case 6:
					FP.world = _world = new Level6(_state);
					break;
			}
		}
	}
}