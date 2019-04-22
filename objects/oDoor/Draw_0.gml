draw_self();
if (door_text != "") {
	if (place_meeting(x, y, oPlayer)) {
		draw_sprite(sArrow, 1, x+32-14, y-158+sin(get_timer()/100000));
		draw_set_font(fBattleTextThick);
		//draw_set_color(BROWN_COL);
		draw_set_halign(fa_center);
		draw_text_outlined(x+32, y-188+sin(get_timer()/100000), OFFWHITE_COL, BROWN_COL, door_text)
		//draw_text(x+32, y-168, door_text)
	}
	
}