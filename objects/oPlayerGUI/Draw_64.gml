/// @description creates gui that shows player hand inventory

//draw white windows
draw_sprite(sHandWindow, 0, 300, 850);
draw_sprite(sHandWindow, 0, 1600, 850);

//draw objects in hands (currently the "are we holding" check
if (oPlayer.holdingL = false) {
	draw_sprite(sEmpty, 0, 300, 850);
}
else {
	draw_sprite(oPlayerPickUpRadius.itemInLeftHand.sprite_index, 0, 300, 850);
}
if (oPlayer.holdingR = false) {
	draw_sprite(sEmpty, 0, 1600, 850);
}
else {
	draw_sprite(oPlayerPickUpRadius.itemInRightHand.sprite_index, 0, 1600, 850);
}