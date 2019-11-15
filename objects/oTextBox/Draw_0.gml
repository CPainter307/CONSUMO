if alarm[1] >= 0 {
	alpha_val = lerp(alpha_val, 0, 0.5)
} else {
	alpha_val = lerp(alpha_val, 1, 0.5)
}

//text effects
t++

//draw textbox
x = camera_get_view_x(view_camera[0]) + textboxPosX;
y = camera_get_view_y(view_camera[0]) + textboxPosY;
draw_sprite_ext(sTextbox, 0, x, y, 1, 1, 0, c_white, alpha_val);

//draw text
draw_set_color(BROWN_COL);

//draw NPC name
draw_set_font(fGUITextThick)
draw_set_halign(fa_center);
draw_text_color(x+(boxWidth/2), y+yBuffer, name,BROWN_COL,BROWN_COL,BROWN_COL,BROWN_COL,alpha_val);

//draw portrait
draw_sprite_ext(portrait, 0, x+491, y-1, 1, 1, 0, c_white, alpha_val)

//draw text
draw_set_font(fTextboxFont)
draw_set_halign(fa_left);
message_end = array_length_1d(text)
	
//next page
if oPlayerInput.key_interact or oPlayerInput.key_jump {
	//audio_play_sound(snd_textbox_progression,1,0);
	if (cutoff < string_length(text[message_current])) {
		cutoff = string_length(text[message_current]);
	}  else if message_current < message_end-1 {
		message_current++
		cutoff = 0
		audio_play_sound(snd_textbox_progression,1,0);
	} else {
		done = true
		alarm[1] = 20
		creator.alarm[0] = 1;
		audio_play_sound(snd_textbox_progression,1,0);
	}
}

if message_end > 0 {
	var tx = x+message_end+xBuffer
	var ty = y+stringHeight+yBuffer
	//var charWidth = string_width("H")
	var charHeight = string_height("H")
	var lineEnd = (boxWidth-xBuffer)/string_width("H")
	var line = 0
	var space = 0
	var i = 1
	var delay = 0
	var lineWidth = 0
	
	//typewriter
	if cutoff < string_length(text[message_current]) {
		if timer >= delay {
			cutoff++
			timer = 0
				if (cutoff mod 4 == 0) {
					scr_play_voice();
				}
		}
		else {
			timer++	
		}
	}
	
	//draw text
	while i <= string_length(text[message_current]) and i <= cutoff {
		if string_char_at(text[message_current], i) == "#" {
			modifier = real(string_char_at(text[message_current], ++i))
			i=++i
		}
		var length = 0
		while string_char_at(text[message_current], i) != " " and i <= string_length(text[message_current]) {
			i++
			length++
		}
		if space+length > lineEnd {
			space = 0
			line++
			lineWidth = 0
			//lineWidth = string_width(string_copy(text[message_current], 0, i-1))
		}
		i -= length
		var current_char = string_char_at(text[message_current], i)
		//var current_width = string_width(string_copy(text[message_current], 0, i-1)) - lineWidth
		lineWidth += string_width(string_char_at(text[message_current], i))

		switch(modifier) {
			case 0: // NORMAL
				draw_text_color(tx+lineWidth, ty+(charHeight*line+15), current_char, BROWN_COL,BROWN_COL,BROWN_COL,BROWN_COL, alpha_val);
				break;
			case 1: // SHAKY
				draw_text_color(tx+lineWidth+random_range(-1,1), ty+(charHeight*line+15)+random_range(-1,1), current_char, BROWN_COL,BROWN_COL,BROWN_COL,BROWN_COL, alpha_val);
				break;
			case 2: // BLUE TEXT
				draw_text_color(tx+lineWidth, ty+(charHeight*line+15), current_char, BLUE_TEXT,BLUE_TEXT,BLUE_TEXT,BLUE_TEXT, alpha_val);
				break;
			case 3: // RED TEXT
				draw_text_color(tx+lineWidth, ty+(charHeight*line+15), current_char, RED_TEXT,RED_TEXT,RED_TEXT,RED_TEXT, alpha_val);
				break
			case 4: // GREEN TEXT
				draw_text_color(tx+lineWidth, ty+(charHeight*line+15), current_char, GREEN_TEXT,GREEN_TEXT,GREEN_TEXT,GREEN_TEXT, alpha_val);
				break
			case 5: // WAVY TEXT
				var so = t + i
				var shift = sin(so*pi*2/room_speed)*5
				draw_text_color(tx+lineWidth, ty+(charHeight*line+15)+shift, current_char, BROWN_COL,BROWN_COL,BROWN_COL,BROWN_COL, alpha_val);
				break
		}
		space++
		i++
	}
}

//draw arrow
if (cutoff >= string_length(text[message_current])) {
	draw_sprite_ext(sArrow, 0, x+sprite_get_width(sTextbox) - 100, y+sprite_get_height(sTextbox) - 70, 1, 1, 0, c_white, alpha_val);
}

//draw skip choice
draw_set_halign(fa_left);
draw_text_colour(x+32, y-40, "F1 TO SKIP", OFFWHITE_COL, OFFWHITE_COL, OFFWHITE_COL, OFFWHITE_COL, alpha_val + sin(get_timer()/1000000));