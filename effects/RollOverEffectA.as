
package ffroman.effects {
	
	import jp.progression.casts.*;
	import jp.progression.commands.*;
	import jp.progression.events.*;


	import flash.display.*;
	import flash.events.*;
	import flash.net.URLRequest;
	import flash.filters.*;

	import caurina.transitions.Tweener;
	import caurina.transitions.properties.FilterShortcuts;

	public class RollOverEffectA {

		private var _box:Sprite;
		private var _t:DisplayObjectContainer;
		private var _mask:Bitmap;
		private var _col:uint;

		//-----------------------------------------------------------------------------
		//  コンストラクタ
		//-----------------------------------------------------------------------------
		public function RollOverEffectA(tgt:DisplayObjectContainer,col:uint=0xffffff) {
			
			_col = col;
			
			FilterShortcuts.init();
			
			_t = tgt;

			_box=new Sprite();
			_box.graphics.beginFill(_col,0.85);
			_box.graphics.drawRect(0,0,_t.width+1,_t.height+1);
			_t.addChild(_box);
			_box.visible = false;

			_box.cacheAsBitmap = true;
			_box.mouseChildren = false;
			_box.mouseEnabled = false;

			var maskBD = new BitmapData(_t.width,_t.height,true,0x0000ff00);
			maskBD.draw(_t);
			_mask = new Bitmap(maskBD);
			_mask.cacheAsBitmap = true;
			_t.addChild(_mask);

			_box.mask = _mask;


		}
		public function overAction():void {

			_box.visible = true;
			_box.scaleX = 0.1;
			_box.alpha = 1;
			Tweener.addTween(_box,{scaleX:1,time:0.4,transition:"easeOutQuad"});
//			Tweener.addTween(_t,{_Glow_color:_col,_Glow_quality:4,_Glow_alpha:0.3,time:0})
//			Tweener.addTween(_t,{_Glow_blurX:6,_Glow_blurY:6,time:0.6})
		}
		public function outAction():void {
		        outActionHandler();
//			Tweener.addTween(_box,{scaleX:0,time:0.6,transition:"eaeInOutQuart",onComplete:outActionHandler});
//			Tweener.addTween(_box,{alpha:0,time:0.6,transition:"eaeInOutQuart",onComplete:outActionHandler});
//			Tweener.addTween(_t,{_Glow_blurX:0,_Glow_blurY:0,_Glow_alpha:0,time:0.6})
		}
		public function outActionHandler():void {
			_box.visible= false;
		}

	}
	
}
