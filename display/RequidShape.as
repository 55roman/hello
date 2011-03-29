
package ffroman.display {
	
        import caurina.transitions.Tweener;
        
        import flash.display.*;
        import flash.events.*;
        import flash.geom.Point;


	public class RequidShape extends Sprite {
		

                private var numPoints:uint = 18;
                private var l:Number = 100;
                private var points:Array = new Array();
                private var pointsDef:Array = new Array();

                private var cP:Point = new Point(0,0);

                private var n:uint=0;
                private var a:uint = 10;
                private var _spd:Number;
				private var _running:Boolean;
		private var _l:uint;
		private var _col_line:uint;
		private var _col_fill:uint;
		private var _thin:Number;

		public function RequidShape(l:uint,spd:Number=10,rnd:Number=0,fure:Number=30,col1:uint = 0xffffff,thin:Number = 0,col2:uint = 0xdddddd) {
			super();

			_l = l;
			_spd = spd;
			_col_line = col1;
			_col_fill = col2;
			_thin = thin;
			a = fure;
			_running = false;
			pointsDef = generateDefPoint(rnd);

                        for(var i:uint = 0; i<numPoints; i++){
                        	points[i] = new Point();
                        	points[i].x = cP.x+Math.round(Math.random()*60-30+(l*Math.cos(360/(numPoints)*i*Math.PI/180)));
                        	points[i].y = cP.y+Math.round(Math.random()*60-30+(l*Math.sin(360/(numPoints)*i*Math.PI/180)));
                        }

			}





                public function activate():void {
					if(!_running){

                        addEventListener(Event.ENTER_FRAME,update,false,0,true);
					}
//                	onEnterFrame = drawLine;
                }
                public function deactivate():void {
					_running = false;
                        removeEventListener(Event.ENTER_FRAME,update)
//                	onEnterFrame = null;
                }


                public function addA():void {
//                	this.tween("a",60,0.5,"easeOutQuad");
                }

                protected function update(e:Event):void {

                	n+=_spd;
                //	a*=0.96;

                	for(var i:uint=0;i<numPoints;i++){
                		var v:Number=1;
                //		if(i%2==0){v *= -1;}
                		if(i<5){v*=-1}
                		points[i].x = pointsDef[i].x*1.15 + (points[i].x-cP.x)*0.002*v*a*Math.cos(n*Math.PI/180);
                		points[i].y = pointsDef[i].y*1.15 + (points[i].y-cP.y)*0.002*v*a*Math.sin(n*Math.PI/180);
                	}
                	this.graphics.clear();
                	if(_thin>0){
                	        this.graphics.lineStyle(_thin,_col_line);
                	}
                	this.graphics.beginFill(_col_fill,1);

                	this.graphics.moveTo(points[0].x,points[0].y);
                	for(i=0;i<numPoints-1;i++){
                		var xc:Number = (points[i].x+points[i+1].x)/2;
                		var yc:Number = (points[i].y+points[i+1].y)/2;
                		if(i==0){
                			this.graphics.moveTo(xc,yc);
                		} else {
                			this.graphics.curveTo(points[i].x,points[i].y,xc,yc);
                		}
                	}
                	xc = (points[numPoints-1].x+points[0].x)/2;
                	yc = (points[numPoints-1].y+points[0].y)/2;
                	this.graphics.curveTo(points[numPoints-1].x,points[numPoints-1].y,xc,yc);
                	xc = (points[0].x+points[1].x)/2;
                	yc = (points[0].y+points[1].y)/2;
                	this.graphics.curveTo(points[0].x,points[0].y,xc,yc);
                }


                public function generateDefPoint(rnd:Number):Array {
                        var arr:Array = new Array();
                        var div:Number = 360/18;
                        for(var i:uint=0;i<numPoints;i++){
                                var p:Point = new Point(
                                        _l * Math.cos(((i*div)-90)*Math.PI/180)+rnd/2*Math.random()-rnd/2,
                                        _l * Math.sin(((i*div)-90)*Math.PI/180)+rnd/2*Math.random()-rnd/2
                                )
                                arr.push(p);
                        }
                        return arr;
                }
                
		
	}
	
}
