
package ffroman.text {
	
	import flash.text.*;
	
	public class PrototypeTextFormat extends TextFormat {
		
		public var font_list:Array;
		public var font_name_list:Array;

		public function PrototypeTextFormat(){
			super();
			
			font_list = Font.enumerateFonts(true);
			font_name_list = font_list.map(returnFontName);
			function returnFontName(val:Font, index:int, array:Array):String {
			  return String(val.fontName);
			}
			
			align = TextFormatAlign.LEFT;
			font =

/*			 font_name_list.indexOf('AXIS Std M') != -1
			    ? 'AXIS Std M'
			    : font_name_list.indexOf('小塚ゴシック Pro B') != -1
			      ? '小塚ゴシック Pro B'
			  	: font_name_list.indexOf('Meiryo') != -1
			    		? 'Meiryo'
						      : '_ゴシック';*/
			font_name_list.indexOf('ヒラギノ角ゴ Pro W3') != -1
				? 'ヒラギノ角ゴ Pro W3'
				: font_name_list.indexOf('ＭＳ Ｐゴシック') != -1
				? 'ＭＳ Ｐゴシック'
				: '_ゴシック';
/*			font_name_list.indexOf('AXIS Std M') != -1
				? 'AXIS Std M'
				: font_name_list.indexOf('ヒラギノ角ゴ') != -1
				? 'ヒラギノ角ゴ'
				: font_name_list.indexOf('ＭＳ Ｐゴシック') != -1
				? 'ＭＳ Ｐゴシック'
				: font_name_list.indexOf('MS P Gothic') != -1
				? 'MS P Gothic'
				: font_name_list.indexOf('Meiryo') != -1
				? 'Meiryo'
				: '_ゴシック';*/
			color = 0x333333;
			leading = 10;

		}
		
		
		
	}
	
}
