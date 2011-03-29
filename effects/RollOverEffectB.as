
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
	import caurina.transitions.properties.ColorShortcuts;

	public class RollOverEffectB {

		private var _box:Sprite;
		private var _t:DisplayObjectContainer;
		private var _mask:Bitmap;
		private var _col:uint;

		//-----------------------------------------------------------------------------
		//  コンストラクタ
		//-----------------------------------------------------------------------------
		public function RollOverEffectB(tgt:DisplayObjectContainer,col:uint=0xffffff) {
			
			_col = col;
			
			FilterShortcuts.init();
			ColorShortcuts.init();

			_t = tgt;

		}
		public function overAction():void {
//			Tweener.addTween(_t,{_tintBrightness:0.4,time:0.6})
			Tweener.addTween(_t,{_brightness:0.7,time:0.6})
			Tweener.addTween(_t,{_Glow_color:_col,_Glow_quality:4,_Glow_alpha:0.3,time:0})
			Tweener.addTween(_t,{_Glow_blurX:6,_Glow_blurY:6,time:0.6})
		}
		public function outAction():void {
//			Tweener.addTween(_t,{_tintBrightness:0,time:0.6})
			Tweener.addTween(_t,{_brightness:0,time:0.6})
			Tweener.addTween(_t,{_Glow_blurX:0,_Glow_blurY:0,_Glow_alpha:0,time:0.6})
		}

	}
	
}
