/// @description condition clean-up to make sure glitches don't happen with throwing and picking up

 //play a random throw sound
if (throwingR || throwingL) {
	var sound_num = irandom_range(0,2);
	switch (sound_num) {
		case 0: // play throw sound 1
			audio_play_sound(snd_throw_1, 5, false);
			break;
		case 1: // play throw sound 2
			audio_play_sound(snd_throw_2, 5, false);
			break;
		case 2: // play throw sound 3
			audio_play_sound(snd_throw_3, 5, false);
			break;
	}
}

//more bug fixing
weCanPickUp = false;

//reset left throw flags
if (throwingL) {
	itemInLeftHand = noone;
	throwingL = false;
}

//reset right throw flags
if (throwingR) {
	itemInRightHand = noone;
	throwingR = false;
}
