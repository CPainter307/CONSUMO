/// @description Controls what happens when target is hit

//collision check and sound play
if (place_meeting(x, y, oHoldableObject)) {
	var ID = instance_place(x, y, oHoldableObject);
	if (!ID.followingL && !ID.followingR) {
		if (playSound) {
			audio_play_sound(snd_target_hit, 0, false);
			playSound = false;
		}
	isHit = true;
	}
}

//sprite change
if (isHit) sprite_index = sTargetGreen;