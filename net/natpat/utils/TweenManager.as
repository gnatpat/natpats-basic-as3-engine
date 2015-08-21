package net.natpat.utils 
{
	import net.natpat.GV;
	/**
	 * ...
	 * @author Nathan Patel
	 */
	public class TweenManager
	{
		
		public var tween:TweenObject = null;

        public function TweenManager()
        {
        }
		
		public function newTween(func:Function, length:Number, ease:Function = null, repeatable:Boolean = false, callback:Function = null):void
		{
			if (ease == null) ease = Ease.none;
			var newTween:TweenObject = new TweenObject(func, length, ease, repeatable, callback);
			newTween.next = tween;
			newTween.prev = null;
			if (newTween.next) newTween.next.prev = newTween;
			tween = newTween;
		}
		
		public function update():void
		{
			var t:TweenObject = tween;
			var elapsed:Number = GV.elapsed;
			while (t != null)
			{
				t.time += elapsed;
                t.func(t.ease(t.time));

				if (t.repeatable)
				{
					while (t.time > t.length)
					{
						t.time -= t.length;
						t.callback();
					}
				}
				
				if (t.time >= t.length)
				{
					t.time = t.length;
					if(!t.done) t.callback();
					t.done = true;
				}
				t = t.next;
			}
		}

	}

}

internal class TweenObject
{
	public var time:Number = 0;

    public var func:Function;
	public var length:Number;
	public var callback:Function;
	public var ease:Function;

	public var next:TweenObject;
	public var prev:TweenObject;
	public var done:Boolean;
	public var repeatable:Boolean = false;
	
	public function TweenObject(func:Function, length:Number, ease:Function = null, repeatable:Boolean = false, callback:Function = null)
	{
        this.func = func;
		this.length = length;
		this.callback = callback;
        this.repeatable = repeatable;
		this.ease = ease;
		done = false;
	}
}
