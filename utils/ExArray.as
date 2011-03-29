
package ffroman.utils {

	public class ExArray {
		
		
		
		static public function shuffle(arr:Array):Array{
			var l:uint = arr.length;
			var newArr:Array = arr;
			while(l){
				var m:int = Math.floor(Math.random()*l);
				var n:* = newArr[--l];
				newArr[l] = newArr[m];
				newArr[m] = n;
			}
			return newArr;
		}
	}

}