package net.natpat.utils 
{
	/**
	 * ...
	 * @author Nathan Patel
	 */
	public class Vector2D 
	{
		public var x:Number;
		
		public var y:Number;
		
		public function Vector2D(x:Number = 0, y:Number = 0) 
		{
			this.x = x;
			this.y = y;
		}
		
		public function add(v:Vector2D):void
		{
			this.x += v.x;
			this.y += v.y;
		}
		
		public function sub(v:Vector2D):void
		{
			this.x -= v.x;
			this.y -= v.y;
		}
		
		public function multiply(value:int):void
		{
			x *= value;
			y *= value;
		}
		
		public function divide(value:int):void
		{
			if (m != 0)
			{
				x /= value;
				y /= value;
			}
		}
		
		public function mag():Number
		{
			return Math.sqrt(x * x + y * y);
		}
		
		public function normalise():void
		{
			var m:Number = mag();
			divide(m);
		}
	}

}