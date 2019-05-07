if (!instance_exists(oCutscene)) {
	if (place_meeting(x, y, oPlayer)) {
		create_cutscene(t_scene_info);
		instance_destroy();
	}
	audio_sound_gain(snd_main_theme, 100, 1);
}