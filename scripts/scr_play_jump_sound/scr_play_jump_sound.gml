var snd = irandom_range(1, 3);
part_emitter_burst(global.ps, em, global.pt_dust, 50);
//part_particles_create(global.ps, x, y+60, global.pt_dust, 50)
switch (snd) {
	case 1: audio_play_sound(snd_jumps_1, 4, false); break;
	case 2: audio_play_sound(snd_jumps_2, 4, false); break;
	case 3: audio_play_sound(snd_jumps_3, 4, false); break;
}