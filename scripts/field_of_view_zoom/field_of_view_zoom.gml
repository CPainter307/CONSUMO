if keyboard_check_pressed(219) { //219 = "["
	camera_width = camera_width * 0.75;
	camera_height = camera_height * 0.75;
}
if keyboard_check_pressed(221) { //221 = "]"
	camera_width = camera_width * 4/3;
	camera_height = camera_height * 4/3;
}