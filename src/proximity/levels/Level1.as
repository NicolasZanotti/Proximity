package proximity.levels
{
	import proximity.model.GameplayState;
	import proximity.utilities.LevelBuilder;

	/**
	 * @author Nicolas Zanotti
	 */
	public class Level1 extends AbstractLevel
	{
		public function Level1(state:GameplayState)
		{
			super();
			var builder:LevelBuilder = new LevelBuilder(this);
			builder.buildFromMockup("MockLevel1", state);
		}
	}
}