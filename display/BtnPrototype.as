<<<<<<< HEAD﻿/*========================================================================**	BtnPrototype**	@ボタン機能の拡充及びシンボルへのボタン機能の付与**	BtnPrototype(*		_mc:DisplayObject,			//スキンへの参照*		_hit:DisplayObject=null,	//hitArea用スキンクリップ (省略可)*		_up:DisplayObject=null,		//up状態用スキンクリップ*		_over:DisplayObject=null,	//over状態用スキンクリップ(省略可)*		_down:DisplayObject=null	//down状態用スキンクリップ(省略可)*	)*=========================================================================*/package ffroman.display {	import flash.display.*;	import flash.events.*;	import flash.geom.Rectangle;	public class BtnPrototype extends SimpleButton {		public var behave:String = "up";		private var myClip:*;		private var labels:Array;		private var isOut:Boolean = false;		public function BtnPrototype(_mc:*,_hit:Sprite=null,_up:Sprite=null,_over:Sprite=null,_down:Sprite=null){			myClip = _mc;			upState = _up;			overState = _over;			downState = _down;			//hitエリアクリップが渡されてなければスキンクリップのサイズを元にhitエリアを生成			if(!_hit){				var hitClip:Shape = new Shape();				var rect:Rectangle = myClip.getRect(myClip);				hitClip.graphics.beginFill(0x991111,1);				hitClip.graphics.moveTo(0,0);				hitClip.graphics.lineTo(rect.width,0);				hitClip.graphics.lineTo(rect.width,rect.height);				hitClip.graphics.lineTo(0,rect.height);				hitClip.graphics.lineTo(0,0);				hitClip.x = rect.x;				hitClip.y = rect.y;				hitTestState = hitClip;			} else {				hitTestState = (_hit)?_hit:_up;			}			if(myClip is MovieClip){				labels = myClip.currentLabels;			}			//リスナー登録			addEventListener(MouseEvent.MOUSE_OVER,onRollOver,false,0,true);			addEventListener(MouseEvent.MOUSE_OUT,onRollOut,false,0,true);			addEventListener(MouseEvent.MOUSE_DOWN,onPress,false,0,true);			addEventListener(MouseEvent.MOUSE_UP,onRelease,false,0,true);		}				//Over時にスキンとなるクリップ内の overFunc()を実行		private function onRollOver(e:Event):void{			if (enabled){				behave = "over";				isOut = false;				try{					myClip.overFunc();				} catch(e:Error){}				if(myClip is MovieClip){					for(var a:* in labels){						if(labels[a].name == "over"){							myClip.gotoAndPlay("over");							break;						}					}				}			}		}		//Out時にスキンとなるクリップ内の outFunc()を実行		private function onRollOut(e:Event):void{			if (enabled){				behave = "up";				isOut = true;				try{ myClip.outFunc(); } catch(e:Error){}				if(myClip is MovieClip){					for(var a:* in labels){						if(labels[a].name == "out"){							myClip.gotoAndPlay("out");							break;						}					}				}			}		}		//Relaase時にスキンとなるクリップ内の relaaseFunc()を実行		private function onRelease(e:Event):void{			if (enabled){				if(!isOut){					//release//					trace("releaseInSide")				} else {					//releaseOut//					trace("releaseOutSide")				}					behave = "release";				stage.removeEventListener(MouseEvent.MOUSE_UP, onRelease);				try{ myClip.releaseFunc(); } catch(e:Error){}				if(myClip is MovieClip){					for(var a:* in labels){						if(labels[a].name == "release"){							myClip.gotoAndPlay("release");							break;						}					}				}			}		}			//Press時にスキンとなるクリップ内の pressFunc()を実行		private function onPress(e:Event):void{			if(enabled){				behave = "press";				stage.addEventListener(MouseEvent.MOUSE_UP, onRelease);				try { myClip.pressFunc(); } catch(e:Error){}				if(myClip is MovieClip){					for(var a:* in labels){						if(labels[a].name == "press"){							myClip.gotoAndPlay("press");							break;						}					}				}			}		}		//enabled設定(俺用)		public function setFunc(_b:Boolean):void{			enabled = _b;		}		public function setHit($clip:Sprite):void{			hitTestState = $clip;		}	}}=======<<<<<<< HEAD﻿/*========================================================================**	BtnPrototype**	@ボタン機能の拡充及びシンボルへのボタン機能の付与**	BtnPrototype(*		_mc:DisplayObject,			//スキンへの参照*		_hit:DisplayObject=null,	//hitArea用スキンクリップ (省略可)*		_up:DisplayObject=null,		//up状態用スキンクリップ*		_over:DisplayObject=null,	//over状態用スキンクリップ(省略可)*		_down:DisplayObject=null	//down状態用スキンクリップ(省略可)*	)*=========================================================================*/package ffroman.display {        //This is Ver2 branch        	import flash.display.*;	import flash.events.*;	import flash.geom.Rectangle;	public class BtnPrototype extends SimpleButton {		public var behave:String = "up";		private var myClip:*;		private var labels:Array;		private var isOut:Boolean = false;		public function BtnPrototype(_mc:*,_hit:Sprite=null,_up:Sprite=null,_over:Sprite=null,_down:Sprite=null){			myClip = _mc;			upState = _up;			overState = _over;			downState = _down;			//hitエリアクリップが渡されてなければスキンクリップのサイズを元にhitエリアを生成			if(!_hit){				var hitClip:Shape = new Shape();				var rect:Rectangle = myClip.getRect(myClip);				hitClip.graphics.beginFill(0x991111,1);				hitClip.graphics.moveTo(0,0);				hitClip.graphics.lineTo(rect.width,0);				hitClip.graphics.lineTo(rect.width,rect.height);				hitClip.graphics.lineTo(0,rect.height);				hitClip.graphics.lineTo(0,0);				hitClip.x = rect.x;				hitClip.y = rect.y;				hitTestState = hitClip;			} else {				hitTestState = (_hit)?_hit:_up;			}			if(myClip is MovieClip){				labels = myClip.currentLabels;			}			//リスナー登録			addEventListener(MouseEvent.MOUSE_OVER,onRollOver,false,0,true);			addEventListener(MouseEvent.MOUSE_OUT,onRollOut,false,0,true);			addEventListener(MouseEvent.MOUSE_DOWN,onPress,false,0,true);			addEventListener(MouseEvent.MOUSE_UP,onRelease,false,0,true);		}				//Over時にスキンとなるクリップ内の overFunc()を実行		private function onRollOver(e:Event):void{			if (enabled){				behave = "over";				isOut = false;				try{					myClip.overFunc();				} catch(e:Error){}				if(myClip is MovieClip){					for(var a:* in labels){						if(labels[a].name == "over"){							myClip.gotoAndPlay("over");							break;						}					}				}			}		}		//Out時にスキンとなるクリップ内の outFunc()を実行		private function onRollOut(e:Event):void{			if (enabled){				behave = "up";				isOut = true;				try{ myClip.outFunc(); } catch(e:Error){}				if(myClip is MovieClip){					for(var a:* in labels){						if(labels[a].name == "out"){							myClip.gotoAndPlay("out");							break;						}					}				}			}		}		//Relaase時にスキンとなるクリップ内の relaaseFunc()を実行		private function onRelease(e:Event):void{			if (enabled){				if(!isOut){					//release//					trace("releaseInSide")				} else {					//releaseOut//					trace("releaseOutSide")				}					behave = "release";				stage.removeEventListener(MouseEvent.MOUSE_UP, onRelease);				try{ myClip.releaseFunc(); } catch(e:Error){}				if(myClip is MovieClip){					for(var a:* in labels){						if(labels[a].name == "release"){							myClip.gotoAndPlay("release");							break;						}					}				}			}		}			//Press時にスキンとなるクリップ内の pressFunc()を実行		private function onPress(e:Event):void{			if(enabled){				behave = "press";				stage.addEventListener(MouseEvent.MOUSE_UP, onRelease);				try { myClip.pressFunc(); } catch(e:Error){}				if(myClip is MovieClip){					for(var a:* in labels){						if(labels[a].name == "press"){							myClip.gotoAndPlay("press");							break;						}					}				}			}		}		//enabled設定(俺用)		public function setFunc(_b:Boolean):void{			enabled = _b;		}		public function setHit($clip:Sprite):void{			hitTestState = $clip;		}	}}=======﻿/*========================================================================**	BtnPrototype**	@ボタン機能の拡充及びシンボルへのボタン機能の付与**	BtnPrototype(*		_mc:DisplayObject,			//スキンへの参照*		_hit:DisplayObject=null,	//hitArea用スキンクリップ (省略可)*		_up:DisplayObject=null,		//up状態用スキンクリップ*		_over:DisplayObject=null,	//over状態用スキンクリップ(省略可)*		_down:DisplayObject=null	//down状態用スキンクリップ(省略可)*	)*=========================================================================*/package ffroman.display {        //Default Branch master?	import flash.display.*;	import flash.events.*;	import flash.geom.Rectangle;	public class BtnPrototype extends SimpleButton {		public var behave:String = "up";		private var myClip:*;		private var labels:Array;		private var isOut:Boolean = false;		public function BtnPrototype(_mc:*,_hit:Sprite=null,_up:Sprite=null,_over:Sprite=null,_down:Sprite=null){			myClip = _mc;			upState = _up;			overState = _over;			downState = _down;			//hitエリアクリップが渡されてなければスキンクリップのサイズを元にhitエリアを生成			if(!_hit){				var hitClip:Shape = new Shape();				var rect:Rectangle = myClip.getRect(myClip);				hitClip.graphics.beginFill(0x991111,1);				hitClip.graphics.moveTo(0,0);				hitClip.graphics.lineTo(rect.width,0);				hitClip.graphics.lineTo(rect.width,rect.height);				hitClip.graphics.lineTo(0,rect.height);				hitClip.graphics.lineTo(0,0);				hitClip.x = rect.x;				hitClip.y = rect.y;				hitTestState = hitClip;			} else {				hitTestState = (_hit)?_hit:_up;			}			if(myClip is MovieClip){				labels = myClip.currentLabels;			}			//リスナー登録			addEventListener(MouseEvent.MOUSE_OVER,onRollOver,false,0,true);			addEventListener(MouseEvent.MOUSE_OUT,onRollOut,false,0,true);			addEventListener(MouseEvent.MOUSE_DOWN,onPress,false,0,true);			addEventListener(MouseEvent.MOUSE_UP,onRelease,false,0,true);		}				//Over時にスキンとなるクリップ内の overFunc()を実行		private function onRollOver(e:Event):void{			if (enabled){				behave = "over";				isOut = false;				try{					myClip.overFunc();				} catch(e:Error){}				if(myClip is MovieClip){					for(var a:* in labels){						if(labels[a].name == "over"){							myClip.gotoAndPlay("over");							break;						}					}				}			}		}		//Out時にスキンとなるクリップ内の outFunc()を実行		private function onRollOut(e:Event):void{			if (enabled){				behave = "up";				isOut = true;				try{ myClip.outFunc(); } catch(e:Error){}				if(myClip is MovieClip){					for(var a:* in labels){						if(labels[a].name == "out"){							myClip.gotoAndPlay("out");							break;						}					}				}			}		}		//Relaase時にスキンとなるクリップ内の relaaseFunc()を実行		private function onRelease(e:Event):void{			if (enabled){				if(!isOut){					//release//					trace("releaseInSide")				} else {					//releaseOut//					trace("releaseOutSide")				}					behave = "release";				stage.removeEventListener(MouseEvent.MOUSE_UP, onRelease);				try{ myClip.releaseFunc(); } catch(e:Error){}				if(myClip is MovieClip){					for(var a:* in labels){						if(labels[a].name == "release"){							myClip.gotoAndPlay("release");							break;						}					}				}			}		}			//Press時にスキンとなるクリップ内の pressFunc()を実行		private function onPress(e:Event):void{			if(enabled){				behave = "press";				stage.addEventListener(MouseEvent.MOUSE_UP, onRelease);				try { myClip.pressFunc(); } catch(e:Error){}				if(myClip is MovieClip){					for(var a:* in labels){						if(labels[a].name == "press"){							myClip.gotoAndPlay("press");							break;						}					}				}			}		}		//enabled設定(俺用)		public function setFunc(_b:Boolean):void{			enabled = _b;		}		public function setHit($clip:Sprite):void{			hitTestState = $clip;		}	}}>>>>>>> master change>>>>>>> Ver2