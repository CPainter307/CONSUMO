var axis_dir = argument0; //gamepad axis
var u_check = global.up_check;
var d_check = global.down_check;
var l_check = global.left_check;
var r_check = global.right_check;
var output = 0;


//when held
switch (axis_dir) {
	case (global.key_up):
		if((gamepad_axis_value(0, axis_dir) < -0.5) && u_check == true) { //when held
			u_check = true;
			output = 0;
		}
		else if((gamepad_axis_value(0, axis_dir) < -0.5) && u_check == false) { //when initially pressed
			u_check = true;
			output = 1;
		}
		else if((gamepad_axis_value(0, axis_dir) >= -0.5) && u_check == true) { //when released
			u_check = false;
			output = 0;
		}
		else if((gamepad_axis_value(0, axis_dir) >= -0.5) && u_check == false) { //when no input
			u_check = false;
			output = 0;
		}
	break;
	
	case (global.key_down):
		if((gamepad_axis_value(0, axis_dir) > 0.5) && d_check == true) { //when held
			d_check = true;
			output = 0;
		}
		else if((gamepad_axis_value(0, axis_dir) > 0.5) && d_check == false) { //when initially pressed
			d_check = true;
			output = 1;
		}
		else if((gamepad_axis_value(0, axis_dir) <= 0.5) && d_check == true) { //when released
			d_check = false;
			output = 0;
		}
		else if((gamepad_axis_value(0, axis_dir) <= 0.5) && d_check == false) { //when no input
			d_check = false;
			output = 0;
		}
	break;
	
	case (global.key_left):
		if((gamepad_axis_value(0, axis_dir) < -0.5) && l_check == true) { //when held
			l_check = true;
			output = 0;
		}
		else if((gamepad_axis_value(0, axis_dir) < -0.5) && l_check == false) { //when initially pressed
			l_check = true;
			output = 1;
		}
		else if((gamepad_axis_value(0, axis_dir) >= -0.5) && l_check == true) { //when released
			l_check = false;
			output = 0;
		}
		else if((gamepad_axis_value(0, axis_dir) >= -0.5) && l_check == false) { //when no input
			l_check = false;
			output = 0;
		}
	break;
	
	case (global.key_right):
		if((gamepad_axis_value(0, axis_dir) > 0.5) && r_check == true) { //when held
			r_check = true;
			output = 0;
		}
		else if((gamepad_axis_value(0, axis_dir) > 0.5) && r_check == false) { //when initially pressed
			r_check = true;
			output = 1;
		}
		else if((gamepad_axis_value(0, axis_dir) <= 0.5) && r_check == true) { //when released
			r_check = false;
			output = 0;
		}
		else if((gamepad_axis_value(0, axis_dir) <= 0.5) && r_check == false) { //when no input
			r_check = false;
			output = 0;
		}
	break;
}
/*
if((gamepad_axis_value(0, axis_dir) < 0) && check == 1) { //up
	check = 1;
	output = 0;
}
else if((gamepad_axis_value(0, axis_dir) > 0) && check == 1) { //down
	check = 1;
	output = 0;
}
else if((gamepad_axis_value(0, axis_dir) < 0) && check == 1) { //left
	check = 1;
	output = 0;
}
else if((gamepad_axis_value(0, axis_dir) > 0) && check == 1) { //right
	check = 1;
	output = 0;
}

//when initially pressed
if((gamepad_axis_value(0, axis_dir) < 0) && check == 0) { //up
	check = 1;
	output = 1;
}
else if((gamepad_axis_value(0, axis_dir) > 0) && check == 0) { //down
	check = 1;
	output = 1;
}
else if((gamepad_axis_value(0, axis_dir) < 0) && check == 0) { //left
	check = 1;
	output = 1;
}
else if((gamepad_axis_value(0, axis_dir) > 0) && check == 0) { //right
	check = 1;
	output = 1;
}

//when released
if((gamepad_axis_value(0, axis_dir) == 0) && check == 1) { //up
	check = 0;
	output = 0;
}
else if((gamepad_axis_value(0, axis_dir) == 0) && check == 1) { //down
	check = 0-;
	output = 0;
}
else if((gamepad_axis_value(0, axis_dir) == 0) && check == 1) { //left
	check = 0;
	output = 0;
}
else if((gamepad_axis_value(0, axis_dir) == 0) && check == 1) { //right
	check = 0;
	output = 0;
}*/


global.up_check = u_check;
global.down_check = d_check;
global.left_check = l_check;
global.right_check = r_check;
return output;