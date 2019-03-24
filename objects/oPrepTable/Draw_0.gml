/// @description draw bar for ingredients
draw_self();

if (rightIngr != noone && !rightIngr.prepared) {
	draw_sprite_ext(sPrepareBack, 0, x - 30, y + 30, 0.5, 0.5, 0, c_white, 1);
	draw_sprite_ext(sPrepareBar, 0, x - 30, y + 30, (0.5 * (rightIngr.chops * 0.1)), 0.5, 0, c_white, 1);
}

if (leftIngr != noone && !leftIngr.prepared) {
	draw_sprite_ext(sPrepareBack, 0, x - 30, y + 30, 0.5, 0.5, 0, c_white, 1);
	draw_sprite_ext(sPrepareBar, 0, x - 30, y + 30, (0.5 * (leftIngr.chops * 0.1)), 0.5, 0, c_white, 1);
}
