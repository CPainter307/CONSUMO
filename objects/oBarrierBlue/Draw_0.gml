/// @description Insert description here
// You can write your code in this editor
if (active) {
	draw_sprite_ext(sBarrierBlue, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);
}
else {
	draw_sprite_ext(sBarrierBlueGhost, 0, x, y, image_xscale, image_yscale, 0, c_white, 0.25);
}