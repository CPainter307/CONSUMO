//draw textbox
x = camera_get_view_x(view_camera[0]) + textboxPosX;
y = camera_get_view_y(view_camera[0]) + textboxPosY;
draw_sprite(sTextbox, 0, x, y);

//draw text
draw_set_color(BROWN_COL);

//draw NPC name
draw_set_font(fBattleTextThin)
draw_set_halign(fa_center);
draw_text(x+(boxWidth/2), y+yBuffer, name);

//draw portrait
draw_sprite(portrait, 0, x+491, y-1)

//draw dialogue
if (charCount < string_length(text[page])) {
	charCount+=1; // displays one character every frame
	if (charCount mod 4 == 0) {
		scr_play_voice();
	}
}
textPart = string_copy(text[page], 1, charCount);

draw_set_font(fBattleTextThick)
draw_set_halign(fa_left);
stringHeight = string_height("H")+5;
draw_text_ext(x+xBuffer, y+stringHeight+yBuffer+10, textPart, stringHeight, boxWidth);