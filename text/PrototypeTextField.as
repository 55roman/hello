//
//  PrototypeTextField
//
//  Created by motokin on 2008-07-30.
//  Copyright (c) 2008 __MyCompanyName__. All rights reserved.
//

package ffroman.text {

	import flash.text.*;
	
	

	public class PrototypeTextField extends TextField{

		public function PrototypeTextField(){

			autoSize = TextFieldAutoSize.LEFT;
			multiline = true;
			selectable = false;
			wordWrap = true;
			alwaysShowSelection = true;

		}
	
	
	}

}