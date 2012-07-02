package proximity.levels
{
	import proximity.model.GameplayState;
	import proximity.utilities.LevelBuilder;

	/**
	 * @author Nicolas Zanotti
	 */
	public class Level4 extends AbstractLevel
	{
		public function Level4(state:GameplayState)
		{
			super();
			var builder:LevelBuilder = new LevelBuilder(this);
			builder.buildFromMockup("MockLevel4", state)
		}
	}
}