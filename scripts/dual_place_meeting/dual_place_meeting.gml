///@description place_meeting between self and a seperate object with obj2 at set displacement
///@arg0 x
///@arg1 y 
///@arg2 obj1  
///@arg3 obj2

 
var _x = argument0 //checks place_meeting at new change in x for both objects
var _y = argument1 //checks place_meeting at change in y for both objects
var obj1 = argument2  
var obj2 = argument3 

with (obj1) {
			if (place_meeting(obj1.x + _x , obj1.y + _y , obj2)) {
			return true;	
			}
		}
if (place_meeting(x + _x, y + _y, obj2)) {
			return true;	
		}
else {
	

return false;
}