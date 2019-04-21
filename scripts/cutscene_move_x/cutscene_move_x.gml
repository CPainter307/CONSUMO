///@description cutscene_move_x
///@arg object
///@arg x

var obj = argument0
var _x = argument1

if (instance_exists(obj)) {
	if (obj.x < _x) {
		obj.x += 5;
		if (obj.x >= _x) {
			cutscene_end_action();
		}
	} else if (obj.x > _x) {
		obj.x -= 5;
		if (obj.x <= _x) {
			cutscene_end_action();
		}
	}
}
