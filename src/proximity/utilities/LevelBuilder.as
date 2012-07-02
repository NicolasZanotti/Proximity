package proximity.utilities
{
	import proximity.entities.TranslucentBox;
	import proximity.entities.Background;
	import proximity.entities.Box;
	import proximity.entities.HarmfulBox;
	import proximity.entities.SmallBox;
	import proximity.levels.AbstractLevel;
	import proximity.model.GameplayState;

	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	/**
	 * @author Nicolas Zanotti
	 */
	public class LevelBuilder
	{
		private var _level:AbstractLevel;

		public function LevelBuilder(level:AbstractLevel)
		{
			_level = level;
		}

		public function buildFromMockup(libraryName:String, state:GameplayState):void
		{
			var mockLevel:DisplayObjectContainer = new (getDefinitionByName(libraryName) as Class)() as DisplayObjectContainer
			var i:int = 0, n:int = mockLevel.numChildren, obj:DisplayObject;

			for (i; i < n; i++)
			{
				obj = mockLevel.getChildAt(i);

				switch(getQualifiedClassName(obj))
				{
					case "MockBackground":
						var background:Background = new Background();
						background.layer = 100;
						_level.add(background);
						break;
					case "MockBox":
						var	box:Box = new Box(obj.name, obj.x, obj.y, obj.rotation);
						box.layer = 50;
						_level.add(box);
						break;
					case "MockSmallBox":
						var smallBox:SmallBox = new SmallBox(obj.name, obj.x, obj.y, obj.rotation);
						smallBox.layer = 50;
						_level.add(smallBox);
						break;
					case "MockHarmfulBox":
						var harmfulBox:HarmfulBox = new HarmfulBox(obj.name, obj.x, obj.y, obj.rotation);
						harmfulBox.layer = 50;
						_level.add(harmfulBox);
						state.totalHarmfulItems++;
						break;
					case "MockTranslucentBox":
						var translucentBox:TranslucentBox = new TranslucentBox(obj.name, obj.x, obj.y, obj.rotation);
						translucentBox.layer = 50;
						_level.add(translucentBox);
						state.totalTranslucentItems++;
						break;
				}
			}
		}
	}
}
