package proximity.levels
{
	import proximity.model.GameplayState;
	import proximity.utilities.LevelBuilder;

	/**
	 * @author Nicolas Zanotti
	 */
	public class Level5 extends AbstractLevel
	{
		public function Level5(state:GameplayState)
		{
			super();
			var builder:LevelBuilder = new LevelBuilder(this);
			builder.buildFromMockup("MockLevel5", state)
		}
	}
}