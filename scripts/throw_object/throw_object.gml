var direction8 = global.direction8;
///@description throw an object
///@arg0 instance
///@arg1 x 
///@arg2 y  
///@arg3 speed
 
var _inst = argument0
var _x = argument1  //mouse_x
var _y = argument2 //mouse-Y
var _spd = argument3
_spd = _spd 

	scr_play_throw_sound()
	var dir = point_direction(oPlayer.x, oPlayer.y, _x, _y)
	if global.input_type == inputs.analog_stick {
		dir = point_direction(0, 0, _x, _y)
	}

	if (direction8) {
		dir = scr_8_to_deg();
	}

	var _dirx = lengthdir_x(_spd, dir)
	var _diry = lengthdir_y(_spd, dir)


	//physics_world_update_speed(120)



with _inst {
	//physics_apply_impulse(x+_dirx, y+_diry, (_x - x) * _spd, -(y - _y) * _spd)
	//_inst.phy_rotation= dir;
	
	_inst.phy_linear_velocity_x = _dirx // pixles/second
	_inst.phy_linear_velocity_y = _diry 
	_inst.phy_angular_velocity = 2000

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
					_x = 0;
					_y = 1;
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
					//do nothing
			}
		}
	}
	//heavy throwing
	if (oPlayerInput.key_heavy_throw && !oPlayer.has_heavy_thrown) {
		oPlayer.motionx = 0;
		oPlayer.motiony = 0;
		oPlayer.dash_lock = true;
		oPlayer.motionx = (-_dirx/30);
		oPlayer.motiony = (-_diry/30);
		oPlayer.has_heavy_thrown = true;
	}
	//throws object
	//apply_gravity = false
	//reapplies gravity once it's hit a wall or 10 frames passed
	//alarm_set(0, 10)
	if direction8 {
	//	phy_speed_x = _x * _spd * 30;
		//phy_speed_y = _y * _spd * 30;
		//physics_apply_impulse(phy_position_x,phy_position_y,_x,_y);
	} else {
		//phy_speed_x = _dirx;
		//phy_speed_y = _diry;
		//physics_apply_impulse(phy_position_x,phy_position_y,_dirx,_diry);
	}
}

