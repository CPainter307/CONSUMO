// scr_play_pickup_sound(sound)

if (followingR or followingL) {
	if (!playedPickupSound) {
		audio_play_sound(argument0, 5, false);
		playedPickupSound = true;
	}
} else {
	playedPickupSound = false;	
}