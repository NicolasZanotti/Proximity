package proximity.levels
{
	import proximity.model.GameplayState;
	import proximity.utilities.LevelBuilder;

	/**
	 * @author Nicolas Zanotti
	 */
	public class Level6 extends AbstractLevel
	{
		public function Level6(state:GameplayState)
		{
			super();
			new LevelBuilder(this).buildFromMockup("MockLevel6", state)
		}
	}
}