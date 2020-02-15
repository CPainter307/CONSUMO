///@description throw an object
///@arg0 instance
///@arg1 x 
///@arg2 y  
///@arg3 speed
///@arg4 throw_from
 
var _inst = argument0
var _x = argument1
var _y = argument2
var _spd = argument3
var _throw_from = argument4

scr_play_throw_sound()

var dir = point_direction(_throw_from.x, _throw_from.y, _x, _y)
var _dirx = lengthdir_x(_spd, dir)
var _diry = lengthdir_y(_spd, dir)

with _inst {
	_inst.phy_linear_velocity_x = _dirx // pixles/second
	_inst.phy_linear_velocity_y = _diry 
	_inst.phy_angular_velocity = 2000
}

