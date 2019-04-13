//draw textbox
draw_sprite(sTextbox, 0, x, y);


//draw text
draw_set_color(BROWN_COL);

//draw NPC name
draw_set_font(fBattleTextThin)
draw_set_halign(fa_center);
draw_text(x+(boxWidth/2), y+yBuffer, name);

//draw dialogue
if (charCount < string_length(text[page])) charCount+=1; // displays one character every frame 
textPart = string_copy(text[page], 1, charCount);

draw_set_font(fBattleTextThick)
draw_set_halign(fa_left);
draw_text_ext(x+xBuffer, y+stringHeight+yBuffer+10, textPart, stringHeight, boxWidth);