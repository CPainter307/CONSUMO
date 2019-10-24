<<<<<<< HEAD
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
	gravity = 0
	physics_apply_impulse(x+_dirx, y+_diry, (_x - x) * _spd, -(y - _y) * _spd)
	oPlayer.motionx = 0
	oPlayer.motiony = 0
	oPlayer.motionx = (-_dirx)
	oPlayer.motiony = (-_diry)
}
=======
///@description throw an object
///@arg0 instance
///@arg1 x
///@arg2 y
///@arg3 speed

var _inst = argument0
var _x = argument1
var _y = argument2
var _spd = argument3
var dir = point_direction(oPlayer.x, oPlayer.y, _x, _y)
var _dirx = lengthdir_x(_spd, dir)
var _diry = lengthdir_y(_spd, dir)
with _inst {
	physics_apply_impulse(x+_dirx, y+_diry, (_x - x) * _spd, -(y - _y) * _spd)
	_inst.phy_angular_velocity = 100000
	
	oPlayer.motionx = 0
	oPlayer.motiony = 0
	oPlayer.motionx = (-_dirx)
	oPlayer.motiony = (-_diry)
}

/*var inst = instance_create_layer(oPlayer.x, oPlayer.y, "Objects", _item[0])
					throw_object(inst, mouse_x, mouse_y, 20)
>>>>>>> HoldingAnimation
