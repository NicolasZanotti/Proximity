package proximity.levels
{
	import proximity.model.GameplayState;
	import proximity.utilities.LevelBuilder;

	/**
	 * @author Nicolas Zanotti
	 */
	public class Level2 extends AbstractLevel
	{
		public function Level2(state:GameplayState)
		{
			super();
			var builder:LevelBuilder = new LevelBuilder(this);
			builder.buildFromMockup("MockLevel2", state);
		}
	}
}
