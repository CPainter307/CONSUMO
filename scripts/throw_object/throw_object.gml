///@description throw an object
///@arg0 instance
///@arg1 x
///@arg2 y
///@arg3 speed

var _inst = argument0
var _x = argument1
var _y = argument2
var _spd = argument3

var _dirx = lengthdir_x(_spd, _x)
var _diry = lengthdir_y(_spd, _y)
with _inst {
	physics_apply_impulse(x+_dirx, y+_diry, (_x - x) * _spd, -(y - _y) * _spd)
}