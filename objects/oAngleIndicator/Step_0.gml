/// @description Update to change sprite and angle

//follow above player
if (instance_exists(oPlayer)) {
	x = oPlayer.x;
	y = oPlayer.y - 100;
}

//rotate sprite 
var haxis;
var vaxis;

if (!gamepad_is_connected(0)) {
	image_angle = point_direction(oPlayer.x, oPlayer.y, mouse_x, mouse_y);
}

if (gamepad_is_connected(0)) {
	haxis = gamepad_axis_value(0, gp_axislh);
	vaxis = gamepad_axis_value(0, gp_axislv);
	image_angle = point_direction(oPlayer.x, oPlayer.y, haxis, vaxis);
}