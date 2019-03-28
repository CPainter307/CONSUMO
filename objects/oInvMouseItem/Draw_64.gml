var item = mouseItem;
if (item != noone) {
	x = mouse_x;
	y = mouse_y;
	draw_sprite_ext(object_get_sprite(mouseItem), 0, x, y, .3, .3, 0, c_white, 1);
}