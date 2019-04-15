var snd = irandom_range(1, 3);
switch (snd) {
	case 1: audio_play_sound(snd_voice_oldman_1, 10, false); break;
	case 2: audio_play_sound(snd_voice_oldman_2, 10, false); break;
	case 3: audio_play_sound(snd_voice_oldman_3, 10, false); break;
}