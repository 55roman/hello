﻿package ffroman.utils{	import flash.text.TextField;	import flash.display.Sprite;	import flash.utils.getTimer	import flash.events.*;	import flash.system.System;	import ffroman.display.BtnPrototype;	public class MEMCounter extends Sprite{		private var update_time:int = 1000;       // 表示が変わる時間（ミリ秒）		private var draw_count:int = 0;          // 描画カウント		private var old_timer:int =0;  // 時間待避		private var disp:TextField;		private var fps:uint=0;		private var color:uint;		private var btn:BtnPrototype;		public function MEMCounter(col:uint=0x111111){			color = col;			old_timer = getTimer();			setDisplay();			addEventListener(Event.ENTER_FRAME,count);			btn = new BtnPrototype(this);			addChild(btn);		}		public function overFunc(){}		public function outFunc(){}		public function pressFunc(){}		public function releaseFunc(){			visible = false;		}		private function count(e:Event){			disp.text = String(System.totalMemory).replace(/([\d]+?)(?=(?:\d{3})+$)/g, function (t) { return t+","; });		}		private function setDisplay(){			disp = new TextField();			addChild(disp);			disp.width = 200;		    disp.height = 18;			disp.y = 20;			disp.textColor = color;			disp.selectable = false;		}	}}