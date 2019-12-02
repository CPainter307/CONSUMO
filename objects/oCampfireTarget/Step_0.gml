
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
	//initial hit code
	if (!initial_hit) {
		initial_hit = true;
		global.campfire_pulse = true;
	}
	
	if (hit_i < hit_timer) {
		hit_i++;
	}
	else {
		isHit = false;
		hit_i = 0;
		initial_hit = false;
	}
}


//sprite change
if (isHit) {
	sprite_index = sCampfireTargetHit;
}
else {
	sprite_index = sCampfireTarget;
}