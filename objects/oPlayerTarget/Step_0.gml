/// @description Controls what happens when target is hit

//collision check and sound play
if (place_meeting(x, y, oPlayer) && !isHit) {
	audio_play_sound(snd_target_hit, 0, false);
	isHit = true;
}

//sprite change
if (isHit) {
	if (sprite_index == sPlayerTargetRed) {
		global.playerTargeti++;
		sprite_index = sPlayerTargetGreen;
	}
}