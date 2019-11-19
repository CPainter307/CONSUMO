if (place_meeting(x, y, oPlayer)) {
	if (oPlayerInput.key_interact) {
		if (myTextbox == noone) {
			myTextbox = instance_create_layer(textboxPosX, textboxPosY, "Text", oTextbox)
			if (oNewTutorial.oldManText1) {
				myTextbox.text = myText1;
			}
			if (oNewTutorial.oldManText2) {
				myTextbox.text = myText2;
			}
			if (oNewTutorial.oldManText3) {
				myTextbox.text = myText3;
			}
			if (oNewTutorial.oldManText4) {
				myTextbox.text = myText4;
			}
			//if (oNewTutorial.oldManText5) {
			//	myTextbox.text = myText5;
			//}
			myTextbox.creator = self;
			myTextbox.name = myName;
			myTextbox.voice = myVoice
			myTextbox.portrait = myPortrait
			myTextbox.alarm[0] = 10; // key press frame buffer
		}
	}
} else {
	if (myTextbox != noone) {
		instance_destroy(myTextbox)
		myTextbox = noone;
	}
}