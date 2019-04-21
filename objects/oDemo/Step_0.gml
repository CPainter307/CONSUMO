if (instance_exists(eFrogEgg) and trigger_inst == noone) {
	if (eFrogEgg.currentHealth <= 20) {
		trigger_inst = instance_create_layer(0, 0, "Objects", oAutoTrigger);
		trigger_inst.t_scene_info = [
			[cutscene_change_variable, oAdventurer, "startFight", false],
			[cutscene_change_variable, oAdventurer, "sprite_index", sRogueIdle],
			[cutscene_change_camera_target, Warrior],
			[cutscene_fade_sound, snd_main_theme, 0, 2000],
			[cutscene_create_textbox, ["Ow! No! You aren't supposed to be winning!",
									   "*sniff*",
									   "This isn't how it was supposed to go!",
									   ], "Frog Egg", voice.frog_egg, sFrogEggPortrait],
			[cutscene_stop_sound, snd_main_theme],
			[cutscene_change_xscale, eFrogEgg],
			[cutscene_move_x, eFrogEgg, 4040],
			[cutscene_create_textbox, ["Hey, no running! I was winning!",
									   "Did you see that, demi? I totally scrambled that guy!",
									   "Wait, make that poached. Sunny side up?",
									   "Yeah, never mind. Stopping that here."
									   ], "Rogue", voice.lizard, sLizardPortrait],	
			[cutscene_wait, .3],
		]
	}
}