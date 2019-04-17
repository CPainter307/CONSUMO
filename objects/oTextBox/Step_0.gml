if (oPlayerInput.key_interact and alarm_get(0) <= 0) {
	if (charCount < string_length(text[page])) {
		charCount = string_length(text[page]);	
	} else if (page+1 < array_length_1d(text)) {
		page+=1;
		charCount = 0;
	} else {
		instance_destroy();
		creator.alarm[0] = 1;
	}
}