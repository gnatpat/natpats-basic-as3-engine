package net.natpat 
{
	import flash.display.Stage;
	import flash.geom.Point;
	import flash.display.BitmapData;
	
	/**
	 * ...
	 * @author Nathan Patel
	 */
	public class GV 
	{
		
		/**
		 * Reference to the stage
		 */
		public static var stage:Stage;
		
		/**
		 * The bitmapData for the screen.
		 */
		public static var screen:BitmapData;
		
		/**
		 * Milliseconds elapsed since last frame
		 */
		public static var _elapsed:Number = 0;
		
		/**
		 * Factor to multiply elapsed by to give the illusion of speeding up
		 */
		public static var timeFactor:Number = 1;
		
		/**
		 * The camera point. Use it as you will
		 */
		public static var camera:Point = new Point();
		
		/**
		 * The number of seconds elapsed adjusted by timeFactor
		 */
		public static function get elapsed():Number
		{
			return _elapsed * timeFactor;
		}
		
		/**
		 * The actual time elapsed in seconds
		 */
		public static function get actualElapsed():Number
		{
			return _elapsed;
		}
		
		/**
		 * The frame rate currently running at
		 */
		public static function get frameRate():Number
		{
			return 1 / _elapsed;
		}
		
		/**
		 * Using math random, gives a random number between 0 and limit.
		 * @param	limit	The limit for the number.
		 * @return	Random number between 0 and limit
		 */
		public static function rand(limit:int):int
		{
			return Math.random() * limit;
		}
		
		/**
		 * Finds the angle (in degrees) from point 1 to point 2.
		 * @param	x1		The first x-position.
		 * @param	y1		The first y-position.
		 * @param	x2		The second x-position.
		 * @param	y2		The second y-position.
		 * @return	The angle from (x1, y1) to (x2, y2).
		 */
		public static function angle(x1:Number, y1:Number, x2:Number, y2:Number):Number
		{
			var a:Number = Math.atan2(y2 - y1, x2 - x1) * DEG;
			return a < 0 ? a + 360 : a;
		}
		
		// Used for rad-to-deg and deg-to-rad conversion.
		/** @private */ public static const DEG:Number = -180 / Math.PI;
		/** @private */ public static const RAD:Number = Math.PI / -180;
		
	}

}