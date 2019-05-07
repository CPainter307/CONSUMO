///@description cutscene_set_x
///@arg object
///@arg x

var obj = argument0
var _x = argument1

if (instance_exists(obj)) {
	obj.x = _x;
	cutscene_end_action();
}
