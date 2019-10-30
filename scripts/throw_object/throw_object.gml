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

var _dirx = lengthdir_x(_spd, dir)
var _diry = lengthdir_y(_spd, dir)


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
					//do nothing
			}
			physics_apply_impulse(x, y, _x * _spd * 100, _y* _spd * 100)
		}
		
		else physics_apply_impulse(x+_dirx, y+_diry, (_x - x) * _spd, -(y - _y) * _spd)
			_inst.phy_angular_velocity = 100000
			
			if (!oPlayer.on_floor && oPlayerInput.key_heavy_throw) {
				oPlayer.motionx = 0
				oPlayer.motiony = 0
				if (direction8) {
					oPlayer.motionx = (-_x * _spd)
					oPlayer.motiony = (-_y * _spd)	
				}
				else {
					oPlayer.motionx = (-_dirx)
					oPlayer.motiony = (-_diry)
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
		
		physics_apply_impulse(x, y, _x * _spd * 100, _y* _spd * 100)
		_inst.phy_angular_velocity = 100000
	
		if (!oPlayer.on_floor && oPlayerInput.key_heavy_throw) {
			oPlayer.motionx = 0
			oPlayer.motiony = 0
			oPlayer.motionx = (-_x * _spd)
			oPlayer.motiony = (-_y * _spd)
		}
	}

}
