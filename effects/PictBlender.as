package ffroman.effects {
	

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	
	public class PictBlender extends Sprite{
		
		private var _tgt:Bitmap;
		private var _defaultBD:BitmapData;
		private var _detectBD:BitmapData;
		private var _swapColor:uint;
		private var _timing:uint;
		private var _count:uint;
		private var _pixels:Vector.<int>;
		
		public function PictBlender(tgt:Bitmap,allowAlpha:uint=0){

			
			
			_tgt = tgt;
		
			//元データ
			_defaultBD = _tgt.bitmapData.clone();
			//判別用データ（後でなくす)
			_detectBD = _defaultBD.clone();
			
			_pixels = new Vector.<int>();
			
			var cols:uint = _defaultBD.width;
			var rows:uint = _defaultBD.height;

			//透明でないピクセルを検出
			for(var i:uint = 0;i<cols;i++){
				for(var j:uint = 0;j<rows;j++){
					var pix:uint =_defaultBD.getPixel32(i,j);
					var al:uint = uint("0x"+pix.toString(16).substr(0,2)); 
					if(al>allowAlpha){
						_pixels.push(i);
						_pixels.push(j);
					}
				}
				
			}
			
			
		}


		public function startBlendA(swapColor:uint=0xff0000,timing:uint=2):void {
			
			_swapColor = swapColor;
			_timing = timing;
			_count = 0;
			
			addEventListener(Event.ENTER_FRAME,blendAHandler,false,0,true);
			_tgt.stage.addEventListener(MouseEvent.MOUSE_DOWN,function():void {
				stopBlend();
			})
		}
		private function blendAHandler(e:Event):void {

			if(_count % _timing==0){
			
				_count = 0;
				
				//判定用bitmapDataをdraw
				_tgt.visible = false;
				var mtr:Matrix = new Matrix();
				var p:Point = _tgt.localToGlobal(new Point(_tgt.x,_tgt.y));

				
				mtr.translate(-p.x,-p.y);
				_detectBD.draw(_tgt.stage,mtr);
				_tgt.visible = true;
				
				var pl:uint = _pixels.length;
				var px:int;
				var py:int;
				var pix:uint;
				var al:uint;
				var pix2:uint;
				//var pix3:uint;
				
				//描画データをlock
				_tgt.bitmapData.lock();
	
				for(var i:uint =0; i<pl;i+=2){
					px = _pixels[i]; 
					py = _pixels[i+1]; 
					pix =_defaultBD.getPixel32(px,py);
					al = uint("0x"+pix.toString(16).substr(0,2));
					
					pix2 = _detectBD.getPixel(px,py);
					//pix3 = _detectBD.getPixel(px,py);
					
					var setCol:uint;
					
					if(pix2 <= 0x7c7c7c){
						setCol = al << 24| _swapColor;	
					} else {
						setCol = pix;
					}
					_tgt.bitmapData.setPixel32(px,py,setCol);
					
				}
				//描画データをunlock
				_tgt.bitmapData.unlock();
				
			}
			_count++;
			
		}

		
		public function stopBlend():void {
			removeEventListener(Event.ENTER_FRAME,blendAHandler);
			if(_defaultBD){
				_tgt.bitmapData = _defaultBD.clone();
			}
		}
		
		
		//大体カラー用を適用する
		private function applyColor(col:uint):void {

			var str16:String = col.toString(16)
			var r:uint = uint("0x"+str16.substr(0,2));
			var g:uint = uint("0x"+str16.substr(2,2));
			var b:uint = uint("0x"+str16.substr(4,2));

			var matrix:Array = [
				-1, 0, 0, 0, r,
				0, -1, 0, 0, g,
				0, 0, -1, 0, b,
				0, 0, 0, 1, 0
			];
			
			applyFilter(_tgt, matrix);
		}

		private function applyFilter(child:flash.display.Sprite, matrix:Array):void {
			var filter:ColorMatrixFilter = new ColorMatrixFilter(matrix);
			var filters:Array = new Array();
			filters.push(filter);
			child.filters = filters;
			
		}

	}
	
}