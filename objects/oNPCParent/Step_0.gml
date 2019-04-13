if (place_meeting(x, y, oPlayer)) {
	if (oPlayerInput.key_interact) {
		if (myTextbox == noone) {
			myTextbox = instance_create_layer(textboxPosX, textboxPosY, "Text", oTextbox)
			myTextbox.text = myText;
			myTextbox.creator = self;
			myTextbox.name = myName;
			myTextbox.alarm[0] = 10; // key press frame buffer
		}
	}
} else {
	if (myTextbox != noone) {
		instance_destroy(myTextbox)
		myTextbox = noone;
	}
}