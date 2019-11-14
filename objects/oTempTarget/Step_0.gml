
/// @description Controls what happens when target is hit

//collision check and sound play
if (place_meeting(x, y, oHoldableObject) && !isHit) {
	var ID = instance_place(x, y, oHoldableObject);
	if (!ID.followingL && !ID.followingR) {
		audio_play_sound(snd_target_hit, 0, false);
		isHit = true;
	}
}

//green timer
if (isHit) {
	if (hit_i < hit_timer) {
		hit_i++;
	}
	else {
		isHit = false;
		hit_i = 0;
	}
}


//sprite change
if (isHit) {
	sprite_index = sTargetTempHit;
}
else {
	sprite_index = sTargetTemp;
}