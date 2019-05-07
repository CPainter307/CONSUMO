if (!instance_exists(oCutscene)) {
	if (place_meeting(x, y, oPlayer)) {
		instance_create_layer(x, y, "Objects", cutsceneName);
	    audio_sound_gain(snd_main_theme, 100, 1);
		instance_destroy();
	}
}