var axis_dir = argument0; //gamepad axis
var check = global.check;
var output = 0;


//when held
switch (axis_dir) {
	case (global.key_up):
		if((gamepad_axis_value(0, axis_dir) < 0) && check == 1) { //when held
			check = 1;
			output = 0;
		}
		else if((gamepad_axis_value(0, axis_dir) < 0) && check == 0) { //when initially pressed
			check = 1;
			output = 1;
		}
		else if((gamepad_axis_value(0, axis_dir) == 0) && check == 1) { //when released
			check = 0;
			output = 0;
		}
	break;
	
	case (global.key_down):
		if((gamepad_axis_value(0, axis_dir) > 0) && check == 1) { //when held
			check = 1;
			output = 0;
		}
		else if((gamepad_axis_value(0, axis_dir) > 0) && check == 0) { //when initially pressed
			check = 1;
			output = 1;
		}
		else if((gamepad_axis_value(0, axis_dir) == 0) && check == 1) { //when released
			check = 0;
			output = 0;
		}
	break;
	
	case (global.key_left):
		if((gamepad_axis_value(0, axis_dir) < 0) && check == 1) { //when held
			check = 1;
			output = 0;
		}
		else if((gamepad_axis_value(0, axis_dir) < 0) && check == 0) { //when initially pressed
			check = 1;
			output = 1;
		}
		else if((gamepad_axis_value(0, axis_dir) == 0) && check == 1) { //when released
			check = 0;
			output = 0;
		}
	break;
	
	case (global.key_right):
		if((gamepad_axis_value(0, axis_dir) > 0) && check == 1) { //when held
			check = 1;
			output = 0;
		}
		else if((gamepad_axis_value(0, axis_dir) > 0) && check == 0) { //when initially pressed
			check = 1;
			output = 1;
		}
		else if((gamepad_axis_value(0, axis_dir) == 0) && check == 1) { //when released
			check = 0;
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


global.check = check;
return output;