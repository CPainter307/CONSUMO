//if ((oPlayerInput.key_interact or oPlayerInput.key_jump) and alarm_get(0) <= 0) {
//	if (charCount < string_length(text[page])) {
//		charCount = string_length(text[page]);	
//	} else if (page+1 < array_length_1d(text)) {
//		page+=1;
//		charCount = 0;
//		audio_play_sound(snd_textbox_progression,1,0);
//	} else {
//		alarm[1] = 20
//		creator.alarm[0] = 1;
//		audio_play_sound(snd_textbox_progression,1,0);
//	}
//}