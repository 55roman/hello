﻿package ffroman.number {	public class Digit{		public function Digit(){		}		static public function digit($val:*,$d:uint=6):String{			var val:String=$val.toString();			var n:uint = val.length;			if(n<$d){				for(var i:uint=1;i<=($d-n);i++){					val = "0"+val;				}			}			return val;		}	}}