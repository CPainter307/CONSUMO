var snd = irandom_range(1, 3);
switch (snd) {
	case 1: audio_play_sound(snd_throw_1, 5, false); break;
	case 2: audio_play_sound(snd_throw_2, 5, false); break;
	case 3: audio_play_sound(snd_throw_3, 5, false); break;
}