xx = oPlayer.x
yy = oPlayer.y

//draw_self();
//figure the mouse dir and distance for aiming and force
if global.input_type == inputs.keyboard {
	dir = point_direction(xx, yy, mouse_x, mouse_y);
	dir = round(dir/45)
	dir = dir * 45;
}
else if global.input_type == inputs.analog_stick {
		var dir8 = scr_get_8_dir();
			switch (dir8) {
				case direc.right:
					dir = 0;
					break;
				case direc.up_right:
					dir = 45;
					break;
				case direc.up:
					dir = 90;
					break;
				case direc.up_left:
					dir = 135;
					break;
				case direc.left:
					dir = 180;
					break;
				case direc.down_left:
					dir = 225;
					break;
				case direc.down:
					dir = 270
					break;
				case direc.down_right:
					dir = 315;
					break;
				default:
					dir = 270;
					// Had to make this do something. Otherwise, a heavy throw with no directional input would shoot our character into the stratosphere
			}
}
		return dir;