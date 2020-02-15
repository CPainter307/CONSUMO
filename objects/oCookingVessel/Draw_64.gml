var xval = display_get_gui_width()/2
var yval = display_get_gui_height()-(sprite_get_height(sVesselWindow)/2)-10
var xbuff = 20

if timeline_position < 270 {
	if (ds_grid_get(item_grid, 0, 0) != noone) { //draw first ingredient
		draw_sprite(sVesselWindow, 0, xval, yval)
		draw_sprite_ext(ds_grid_get(item_grid, 5, 0), 0, xval-sprite_get_width(sVesselWindow)/2 + xbuff, yval, 1, 1, 0, c_white, 1)
	}
	if (ds_grid_get(item_grid, 0, 1) != noone) { //draw second ingredient
		draw_sprite_ext(ds_grid_get(item_grid, 5, 1), 0, xval, yval, 1, 1, 0, c_white, 1)
	}
	if (ds_grid_get(item_grid, 0, 2) != noone) { //draw third ingredient
		draw_sprite_ext(ds_grid_get(item_grid, 5, 1), 0, xval+sprite_get_width(sVesselWindow)/2 - xbuff, yval, 1, 1, 0, c_white, 1)
	}
} else {
	draw_sprite(sVesselWindow, 0, xval, yval)
	if (ds_grid_get(item_grid, 0, 2) != noone) {
		draw_set_font(fBattleTextThick)
		draw_set_color(BROWN_COL)
		draw_text(xval-(string_width("???")/4), yval-(string_height("???")/2), "???")	
	}
}

if (ds_grid_get(item_grid, 0, 2) != noone) {
	var _col = c_white
	if (timeline_position >= 270 and timeline_position < 540) {
		_col = c_green
	} else if (timeline_position >= 540) {
		_col = c_red	
	}
	draw_circle_color(xval+(sprite_get_width(sVesselWindow)/2)+50, yval, 20, c_gray, c_gray, false)
	draw_circle_color(xval+(sprite_get_width(sVesselWindow)/2)+50, yval, 30, c_dkgray, c_gray, false)
	scr_health_ring(xval+(sprite_get_width(sVesselWindow)/2)+50, yval, 20, 10, 540, timeline_position, 0, 360, 1, _col)
}

if (drawText and textDisappearTimer < 120 and instance_exists(inst)) {
	
	var xpos = display_get_gui_width()/2
	var ypos = display_get_gui_height()-50
	if (inst.hp > 0) var stathp = sMealWindowInc;
	else if (inst.hp < 0) var stathp = sMealWindowDec;
	else var stathp = sMealWindowNeutral;
	
	if (inst.attack > 0) var statatk = sMealWindowInc;
	else if (inst.attack < 0) var statatk = sMealWindowDec;
	else var statatk = sMealWindowNeutral;
	
	if (inst.defense > 0) var statdef = sMealWindowInc;
	else if (inst.defense < 0) var statdef = sMealWindowDec;
	else var statdef = sMealWindowNeutral;
	
	if (inst.spd > 0) var statspd = sMealWindowInc;
	else if (inst.spd < 0) var statspd = sMealWindowDec;
	else var statspd = sMealWindowNeutral;
	
	draw_sprite(stathp, 0, xpos+47, ypos+319);
	draw_sprite(statatk, 0, xpos+123, ypos+319);
	draw_sprite(statdef, 0, xpos+194, ypos+319);
	draw_sprite(statspd, 0, xpos+262, ypos+319);
	draw_sprite(sMealWindow, 0, xpos, ypos);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_font(fBattleTextThick);
	if (inst.hp > 0) draw_text_outlined(xpos+76, ypos+280, OFFWHITE_COL, BROWN_COL, "+" + string(inst.hp));
	else if (inst.hp < 0) draw_text_outlined(xpos+76, ypos+280, OFFWHITE_COL, BROWN_COL, string(inst.hp));
	
	if (inst.attack > 0) draw_text_outlined(xpos+151, ypos+280, OFFWHITE_COL, BROWN_COL, "+" + string(inst.attack));
	else if (inst.attack < 0) draw_text_outlined(xpos+151, ypos+280, OFFWHITE_COL, BROWN_COL, string(inst.attack));

	if (inst.defense > 0) draw_text_outlined(xpos+219, ypos+280, OFFWHITE_COL, BROWN_COL, "+" + string(inst.defense));
	else if (inst.defense < 0) draw_text_outlined(xpos+219, ypos+280, OFFWHITE_COL, BROWN_COL, string(inst.defense));

	if (inst.spd > 0) draw_text_outlined(xpos+286, ypos+280, OFFWHITE_COL, BROWN_COL, "+" + string(inst.spd));
	else if (inst.spd < 0) draw_text_outlined(xpos+286, ypos+280, OFFWHITE_COL, BROWN_COL, string(inst.spd));

	draw_set_font(fBattleTextThin);
	draw_set_color(BROWN_COL);
	draw_text(xpos+256, ypos+215, inst.name);
	draw_sprite_ext(inst.sprite_index, 0, xpos+255, ypos+82, 3, 3, 0, c_white, 1);
	textDisappearTimer++;
	
} else if (textDisappearTimer >= 120) {
    drawText = false;
    textDisappearTimer = 0;
}