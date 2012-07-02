package proximity.ui
{
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.text.TextField;
	import flash.text.TextFormat;

	/**
	 * @author Nicolas Zanotti
	 */
	public class LevelSelectionButton extends MovieClip
	{
		public var bt:SimpleButton;
		public var tf:TextField;

		public function LevelSelectionButton()
		{
			stop();
		}

		public function set active(isActive:Boolean):void
		{
			var textFormat:TextFormat = new TextFormat();

			if (isActive)
			{
				textFormat.color = 0xFFF567;
				tf.setTextFormat(textFormat);
				gotoAndStop(1);
			}
			else
			{
				textFormat.color = 0xFFFFFF;
				tf.setTextFormat(textFormat);
				gotoAndStop(2);
			}
		}
	}
}
