var direction8 = global.direction8;
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
if global.input_type == inputs.analog_stick {
	dir = point_direction(0, 0, _x, _y)
}

var _dirx = lengthdir_x(_spd*30, dir)
var _diry = lengthdir_y(_spd*30, dir)

physics_world_update_iterations(20)
physics_world_update_speed(120)

with _inst {
	if global.input_type == inputs.keyboard {
		//changes direction vars if 8dir is on
		if (direction8) {
			var dir8 = scr_get_8_dir();
			switch (dir8) {
				case direc.right:
					_x = 1;
					_y = 0;
					break;
				case direc.up_right:
					_x = 1;
					_y = -1;
					break;
				case direc.up:
					_x = 0;
					_y = -1;
					break;
				case direc.up_left:
					_x = -1;
					_y = -1;
					break;
				case direc.left:
					_x = -1;
					_y = 0;
					break;
				case direc.down_left:
					_x = -1;
					_y = 1;
					break;
				case direc.down:
					_x = 0;
					_y = 1;
					break;
				case direc.down_right:
					_x = 1;
					_y = 1;
					break;
				default:
					if (oPlayer.player_dir == -1) {	//throw item right
						_x = 1;
						_y = 0;
					}
					else {	//throw item left
						_x = -1;
						_y = 0;
					}
					// Had to make this do something. Otherwise, a heavy throw with no directional input would shoot our character into the stratosphere
			}
		}
	} else if global.input_type == inputs.analog_stick {
		//changes direction vars if 8dir is on
		if (direction8) {
			var dir8 = scr_get_8_dir();
			switch (dir8) {
				case direc.right:
					_x = 1;
					_y = 0;
					break;
				case direc.up_right:
					_x = 1;
					_y = -1;
					break;
				case direc.up:
					_x = 0;
					_y = -1;
					break;
				case direc.up_left:
					_x = -1;
					_y = -1;
					break;
				case direc.left:
					_x = -1;
					_y = 0;
					break;
				case direc.down_left:
					_x = -1;
					_y = 1;
					break;
				case direc.down:
					_x = 0;
					_y = 1;
					break;
				case direc.down_right:
					_x = 1;
					_y = 1;
					break;
				default:
					if (oPlayer.player_dir == -1) {	//throw item right
						_x = 1;
						_y = 0;
					}
					else {	//throw item left
						_x = -1;
						_y = 0;
					}
			}
		}
	}
	//heavy throwing
	var heavy_sign = 1;
	//if (!oPlayer.on_floor && oPlayerInput.key_heavy_throw && !oPlayer.has_heavy_thrown) {
	//	oPlayer.motionx = 0;
	//	oPlayer.motiony = 0;
	//	oPlayer.dash_lock = true;
	//	heavy_sign = -1;
	//	if (direction8) {
	//		oPlayer.motionx = (_x * _spd);
	//		oPlayer.motiony = (_y * _spd);
	//	}
	//	else {
	//		oPlayer.motionx = (_dirx/30);
	//		oPlayer.motiony = (_diry/30);
	//	}
	//	oPlayer.has_heavy_thrown = true;
	//}
	//throws object
	apply_gravity = false
	//reapplies gravity once it's hit a wall or 10 frames passed
	alarm_set(0, 5) //NOTE: SHOULD BE 10 INSTEAD OF 120
	if direction8 {
		phy_speed_x = heavy_sign * _x * _spd * 30;
		phy_speed_y = heavy_sign * _y * _spd * 30;
		physics_apply_impulse(phy_position_x,phy_position_y,_x,_y);
	} else {
		phy_speed_x = heavy_sign * _dirx;
		phy_speed_y = heavy_sign * _diry;
		physics_apply_impulse(phy_position_x,phy_position_y,_dirx,_diry);
	}
}
