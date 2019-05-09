///@description cutscene_set_y
///@arg object
///@arg y

var obj = argument0
var _y = argument1

if (instance_exists(obj)) {
	obj.y = _y;
	cutscene_end_action();
}