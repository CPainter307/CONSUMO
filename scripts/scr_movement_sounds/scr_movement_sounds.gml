///@description this script handles sounds the player makes (footsteps, jumping, landing, etc)

//walking/sprinting sounds
if (sprite_index == sPlayerRun or sprite_index == sPlayerRunHolding) {
	if (floor(image_index) == 0) {
		step1 = true;
		step2 = true;
	}
	if ((floor(image_index) == 2) and step1) {
		audio_play_sound(snd_footstep_1, 10, false);
		step1 = false;
	}
	if ((floor(image_index) == 5) and step2) {
		audio_play_sound(snd_footstep_2, 10, false);
		step2 = false;
	}
}