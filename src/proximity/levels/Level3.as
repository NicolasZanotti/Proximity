package proximity.levels
{
	import proximity.model.GameplayState;
	import proximity.utilities.LevelBuilder;

	/**
	 * @author Nicolas Zanotti
	 */
	public class Level3 extends AbstractLevel
	{
		public function Level3(state:GameplayState)
		{
			super();
			var builder:LevelBuilder = new LevelBuilder(this);
			builder.buildFromMockup("MockLevel3", state);
		}
	}
}
