/// @description creates gui that shows player hand inventory

//draw white windows
draw_sprite(sHandWindow, 0, 300, 820);
draw_sprite(sHandWindow, 0, 1600, 820);

//draw controller scheme
if (gamepad_is_connected(0)) {
	draw_sprite(sLeftBumper, 0, 300, 990);
	draw_sprite(sRightBumper,0, 1600, 990);
}
if (!gamepad_is_connected(0)) {
	draw_sprite(sLeftClick, 0, 300, 990);
	draw_sprite(sRightClick, 0, 1600, 990);
}

//draw objects in hands (currently the "are we holding" check
if (oPlayer.holdingL = false) {
	draw_sprite(sEmpty, 0, 300, 850);
}
else {
	if (instance_exists(oPlayerPickUpRadius.itemInLeftHand)) {
		draw_sprite(oPlayerPickUpRadius.itemInLeftHand.sprite_index, 0, 300, 850);
	}
}
if (oPlayer.holdingR = false) {
	draw_sprite(sEmpty, 0, 1600, 850);
}
else {
	if (instance_exists(oPlayerPickUpRadius.itemInRightHand)) {
		draw_sprite(oPlayerPickUpRadius.itemInRightHand.sprite_index, 0, 1600, 850);
	}
}