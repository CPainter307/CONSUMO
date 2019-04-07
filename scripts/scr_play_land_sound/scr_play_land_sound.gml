var snd = irandom_range(1, 3);
//part_particles_create(global.ps, x, y+60, global.pt_dust, 50)
switch (snd) {
	case 1: audio_play_sound(snd_land_1, 3, false); break;
	case 2: audio_play_sound(snd_land_2, 3, false); break;
	case 3: audio_play_sound(snd_land_3, 3, false); break;
}