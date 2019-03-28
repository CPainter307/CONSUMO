var item = global.inventory[slot];
var click = mouse_check_button_pressed(mb_left);

if (oPlayerInput.mouse_dir >= 0 and oPlayerInput.mouse_dir < 60) { // slot 1
	draw_sprite(sRadialMenuHighlight, 0, oInventory.slotX[1], oInventory.slotY[5]);
}

/*
if ((abs(mouse_x - x) < 64) and (abs(mouse_y - y) < 64)) {
	draw_sprite(sRadialMenuHighlight, 0, x, y);
	if (click) {
		if (item != noone) {
			scr_inv_remove_slot(slot);
		}
		if (mouseItem != noone) {
			scr_inv_add_slot(mouseItem, slot)
		}
		mouseItem = item;
	}
}
*/
if (item != noone) {
	draw_sprite_ext(object_get_sprite(item), 0, x, y, 1, 1, 0, c_white, 1)
}