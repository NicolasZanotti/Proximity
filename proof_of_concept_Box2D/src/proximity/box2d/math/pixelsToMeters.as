package proximity.box2d.math
{
	
	/*
	 * Uses a fixed ratio of 32 pixels per meter.
	 */
	public function pixelsToMeters(px:Number):Number
	{
		return px * .03125;
	}
}