/// @description Update to change sprite and angle

//follow above player
if (instance_exists(oPlayer)) {
	x = oPlayer.x;
	y = oPlayer.y - 100;
}

//rotate sprite (ONLY WORKS WITH MOUSE RIGHT NOW)
image_angle = point_direction(oPlayer.x, oPlayer.y, mouse_x, mouse_y);