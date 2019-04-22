if (instance_exists(eFrogEgg) and trigger_inst == noone) {
	if (eFrogEgg.currentHealth <= 20) {
		mech1 = instance_create_layer(4704, 2976, "Objects", oTadpoleMech);
		mech2 = instance_create_layer(4896, 2976, "Objects", oTadpoleMech);
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
			[cutscene_create_textbox, ["Hey, no running! I was winning!"
									   ], "Rogue", voice.lizard, sLizardPortrait],	
			[cutscene_change_xscale, Warrior],
			[cutscene_wait, .3],
			[cutscene_create_textbox, ["Did you see that, demi? I totally scrambled that guy!",
									   "Wait, make that poached. Sunny side up?",
									   "Yeah, never mind. Stopping that here."
									   ], "Rogue", voice.lizard, sLizardPortrait],	
			[cutscene_wait, .3],
			//[cutscene_instance_create, 4000, 2048, "Objects", oTadpoleMech],
			//[cutscene_change_variable, oDemo, "mech1", instance_place(4000, 2048, oTadpoleMech)],
			//[cutscene_instance_create, 3840, 2048, "Objects", oTadpoleMech],
			//[cutscene_change_variable, oDemo, "mech2", instance_nearest(3840, 2048, oTadpoleMech)],
			[cutscene_change_variable, mech1, "x", 4040],
			[cutscene_change_variable, mech1, "y", 2050],
			[cutscene_change_variable, mech2, "x", 4010],
			[cutscene_change_variable, mech2, "y", 2050],
			[cutscene_create_textbox, ["Who was picking on you again, lil bro?"
									   ], "Tadpole Mech", voice.frog_egg, sTadpoleMechPortrait],
			[cutscene_change_xscale, Warrior],
			[cutscene_change_variable, oAdventurer, "sprite_index", sRogueSurprised],
			[cutscene_wait, .3],
			[cutscene_create_textbox, ["Him! The green scaly one! And the purple guy was helping!"
									   ], "Frog Egg", voice.frog_egg, sFrogEggPortrait],
			[cutscene_move_x, mech1, 2843],
			[cutscene_change_xscale, mech1],
			//[cutscene_wait, 5],
			[cutscene_move_x, mech2, 3270],
			[cutscene_change_xscale, eFrogEgg],
			[cutscene_move_x, eFrogEgg, 3403],
			[cutscene_change_xscale, Warrior],
			[cutscene_play_sound, snd_battle_theme, 10, true],
			[cutscene_change_variable, oAdventurer, "sprite_index", sRogueIdle],
			[cutscene_create_textbox, ["Wow. This sure is swell.",
									   "Hey demi? I think I'm going to need to place another order.",
									   "Pronto!"
									   ], "Rogue", voice.lizard, sLizardPortrait],	
			[cutscene_change_xscale, Warrior],
			[cutscene_change_camera_target, oPlayer],
			[cutscene_change_variable, oAdventurer, "startFight", true]
		]
	}
}

if (!instance_exists(eFrogEgg) and !instance_exists(oTadpoleMech)) {
	var inst = instance_create_layer(0, 0, "Objects", oAutoTrigger);
	inst.t_scene_info = [
		[cutscene_fade_sound, snd_battle_theme, 0, 2000],
		[cutscene_change_camera_target, Warrior],
		[cutscene_create_textbox, ["*pant... pant...*",
								   "We... I... I did it!",
								   "Wow!",
								   "Oh, and uh, thanks for the food.",
								   "It was pretty good most of the time. Definitely hit the spot during that battle.",
								   "Well, I'm heading up now. Do I tip you? Or the old guy?"
							       ], "Rogue", voice.lizard, sLizardPortrait],	
	]
}