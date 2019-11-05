if (drawText and textDisappearTimer < 120 and instance_exists(inst)) {
	
	var xpos = camera_get_view_width(view_camera[0]) / 2;
	var ypos = camera_get_view_height(view_camera[0]) / 1.1;
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