/// @description creates gui that shows player hand inventory

//draw white windows
draw_sprite(sHandWindow, 0, 300, 850);
draw_sprite(sHandWindow, 0, 1600, 850);

//draw objects in hands (currently the "are we holding" check
if (oPlayer.holdingL = false) {
	draw_sprite(sX, 0, 300, 850);
}
else {
	draw_sprite(sCheck, 0, 300, 850);
}
if (oPlayer.holdingR = false) {
	draw_sprite(sX, 0, 1600, 850);
}
else {
	draw_sprite(sCheck, 0, 1600, 850);
}