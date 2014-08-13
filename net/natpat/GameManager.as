package net.natpat 
{
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import net.natpat.gui.Button;
	import net.natpat.gui.InputBox;
	import net.natpat.particles.Emitter;
	import net.natpat.utils.Sfx;
	
	import net.natpat.gui.Text;
	import net.natpat.gui.GuiManager
	import net.natpat.utils.Ease;
	import net.natpat.utils.Key;
	
	/**
	 * ...
	 * @author Nathan Patel
	 */
	public class GameManager 
	{
		
		/**
		 * Bitmap and bitmap data to be drawn to the screen.
		 */
		public var bitmap:Bitmap;
		public static var renderer:BitmapData;
		
		public var text:Text = new Text(10, 10, "Hello, World", 2, true);
		public var emitter:Emitter = new Emitter(new BitmapData(5, 5, true, 0xffffffff));
		
		public function GameManager(stageWidth:int, stageHeight:int) 
		{
			
			GC.SCREEN_WIDTH = stageWidth;
			GC.SCREEN_HEIGHT = stageHeight;
			
			renderer = new BitmapData(stageWidth, stageHeight, false, 0x000000);
			
			bitmap = new Bitmap(renderer);
			
			GV.screen = renderer;
			
			GuiManager.add(text);
			
			emitter.setColor(0xff0000, 0x00cccc);
			emitter.setMotion(0, 25, 0.5, 360, 75, 0.5);
			emitter.setAlpha(1, 0.25);
			
		}
		
		public function render():void
		{
			renderer.lock();
			
			//Render the background
			renderer.fillRect(new Rectangle(0, 0, renderer.width, renderer.height), 0xffffff);		
			
			emitter.render();
			
			GuiManager.render();
			
			renderer.unlock();
		}
		
		public function update():void
		{
			
			GuiManager.update();
			
			emitter.x = Input.mouseX;
			emitter.y = Input.mouseY;
			
			emitter.emit();
			emitter.emit();
			emitter.emit();
			emitter.update();
			
			Input.update();
		}
		
	}

}