scr_get_input();

//for taking input based on player position
if instance_exists(oPlayer) {
	x = oPlayer.x;
	y = oPlayer.y;
}

if (keyboard_check_pressed(ord("8"))) {
	global.direction8 = !global.direction8
}