///@description place_meeting between different onjects
///@arg0 x
///@arg1 y 
///@arg2 obj1  
///@arg3 obj2
 
var _x = argument0
var _y = argument1
var obj1 = argument2  
var obj2 = argument3 

with (obj1) {
		if (place_meeting(_x, _y, obj2)) {
			return true;	
		}
		else {
			return false;	
		}
	}