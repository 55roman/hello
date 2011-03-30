package ffroman
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.geom.Rectangle;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	public class StageFitRect
	{
		public function StageFitRect() {
		}
		
		//test
		public static function apply(stage:*,w:int,h:int):Rectangle {

			if(getQualifiedClassName(stage).split("::")[1]=="Stage"){
				var sW:uint = stage.stageWidth;
				var sH:uint = stage.stageHeight;
			} else {
				sW = stage.width;
				sH = stage.height;
			}
			var imgWidth:uint = w;
			var imgHeight:uint = h;
			
			var viewerRatio:Number = sH / sW;
			var imgRatio:Number = imgHeight/imgWidth;
			
			var imgScale:Number;
            if(imgRatio > 1){
                
                //縦位置写真   
//                imgScale = sH/imgHeight;
				//横位置写真
				if(imgRatio>viewerRatio){
					imgScale = sW/imgWidth;
				} else {
					imgScale = sH/imgHeight;
				}
				
            } else {
				
				//横位置写真
    			if(imgRatio>viewerRatio){
    				imgScale = sW/imgWidth;
    			} else {
    				imgScale = sH/imgHeight;
    			}
            }

			imgWidth *= imgScale;
			imgHeight *= imgScale;

			return new Rectangle((sW-imgWidth)/2,(sH-imgHeight)/2,imgWidth,imgHeight);

		}

		public static function applyUsePercent(rect:Rectangle,w:int,h:int):Number {
			
			var sW:uint = rect.width;
			var sH:uint = rect.height;
			var imgWidth:uint = w;
			var imgHeight:uint = h;
			
			var viewerRatio:Number = sH / sW;
			var imgRatio:Number = imgHeight/imgWidth;
			
			var imgScale:Number;
			if(imgRatio > 1){
				
				//縦位置写真   
				imgScale = sH/imgHeight;
				
			} else {
				
				//横位置写真
				if(imgRatio>viewerRatio){
					imgScale = sW/imgWidth;
				} else {
					imgScale = sH/imgHeight;
				}
			}

			return imgScale
			
		}
		
		
		public static function applyVerticalUsePercent(stage:Stage,w:int,h:int):Number {
			
			var sW:uint = stage.stageWidth;
			var sH:uint = stage.stageHeight;
			var imgWidth:uint = w;
			var imgHeight:uint = h;
			
			var viewerRatio:Number = stage.stageHeight / stage.stageWidth;
			var imgRatio:Number = imgHeight/imgWidth;
			
			var imgScale:Number;
			
			imgScale = sH/imgWidth;
/*			if(imgRatio > 1){
				
				//縦位置写真   
				imgScale = sH/imgHeight;
				
			} else {*/
				
				//横位置写真
				/*if(imgRatio>viewerRatio){
					imgScale = sW/imgWidth;
				} else {
					imgScale = sH/imgHeight;
				}*/
		/*	}*/
			
			return imgScale
			
		}
		
		public static function applyInnerRect(rect:Rectangle,w:int,h:int):Rectangle {

			var sW:uint = rect.width;
			var sH:uint = rect.height;
			var imgWidth:uint = w;
			var imgHeight:uint = h;
			
			var viewerRatio:Number = sH / sW;
			var imgRatio:Number = imgHeight/imgWidth;
			
			var imgScale:Number;
			if(imgRatio > 1){
				
				//縦位置写真   
				imgScale = sH/imgHeight;
				 
			} else {
				
				//横位置写真
				if(imgRatio>viewerRatio){
					imgScale = sH/imgHeight;
					
				} else {
					imgScale = sW/imgWidth;
				}
			}
			
			imgWidth *= imgScale;
			imgHeight *= imgScale;
			
			return new Rectangle((sW-imgWidth)/2,(sH-imgHeight)/2,imgWidth,imgHeight);
		}
		
		
	}
}