t_scene_info = [
	[cutscene_stop_cooking_timeline],
	[cutscene_change_variable, oAdventurer, "startFight", false],
	[cutscene_change_camera_target, Warrior],
	[cutscene_wait, 1],
	[cutscene_change_xscale, Warrior],
	[cutscene_create_textbox, ["So you finally decided to--"], "Rogue", voice.lizard, sLizardPortrait],
	[cutscene_wait, .5],
	[cutscene_create_textbox, ["..."], "Rogue", voice.lizard, sLizardPortrait],
	[cutscene_wait, .5],
	[cutscene_create_textbox, ["Really? They didn't tell me this was THAT kinda restaurant."], "Rogue", voice.lizard, sLizardPortrait],
	[cutscene_wait, .5],
	[cutscene_create_textbox, ["Whatever. Hey, demi, can you understand me? I'm about to go into battle here.",
							   "You know, risk my life for treasure, glory, and the good of the world?",
							   "The pamphlet said you guys cook the food up during battle and deliver it to us, right?",
							   "Well, I'm a good catch, so once you've cooked up a meal, just throw it to me and I'll catch and eat it."
							   ], "Rogue", voice.lizard, sLizardPortrait],
	[cutscene_wait, .5],
	[cutscene_create_textbox, ["What? I'm serious.",
							   "Looks like they delivered the ingredient stores down here. So just walk up to one and press " + leftHandString + " or " + rightHandString + " to grab an ingredient from it."
							   ], "Rogue", voice.lizard, sLizardPortrait],
	[cutscene_screenshake, 30, 120],
	[cutscene_play_sound, snd_cave_rumble, 10, false],
	[cutscene_play_sound, snd_epic_theme, 9, false],
	[cutscene_wait, 2],
	[cutscene_create_textbox, ["Oh boy... here we go."
							   ], "Rogue", voice.lizard, sLizardPortrait],
	[cutscene_wait, .5],
	[cutscene_change_xscale, Warrior],
	[cutscene_create_textbox, ["They say this place was once an ancient temple long before erosion and natural disasters destroyed it. Now all that's left are these cave ruins.",
							   "But over time... evil has moved in.",
							   "Unspeakable evil.",
							   "The Great Frog God has taken up residence down here, and he leads his minions with an iron fist."
							   ], "Rogue", voice.lizard, sLizardPortrait],
	[cutscene_screenshake, 30, 120],
	[cutscene_play_sound, snd_cave_rumble, 10, false],
	[cutscene_wait, 2],
	[cutscene_create_textbox, ["And here comes some of his unholy fury right now!",
							   ], "Rogue", voice.lizard, sLizardPortrait],
	[cutscene_stop_sound, snd_epic_theme],
	[cutscene_move_x, eFrogEgg, 3197],
	[cutscene_wait, 1],
	[cutscene_create_textbox, ["..."
							   ], "Rogue", voice.lizard, sLizardPortrait],
	[cutscene_wait, 1],
	[cutscene_create_textbox, ["..."
							   ], "Frog Egg", voice.frog_egg, sFrogEggPortrait],
	[cutscene_wait, 1],
	[cutscene_create_textbox, ["So... you aren't a frog."
							   ], "Rogue", voice.lizard, sLizardPortrait],
	[cutscene_wait, .3],
	[cutscene_create_textbox, ["Not, yet, no."
							   ], "Frog Egg", voice.frog_egg, sFrogEggPortrait],						   
	[cutscene_wait, .3],
	[cutscene_create_textbox, ["Are you... my challenge? The monster in this dungeon?"
							   ], "Rogue", voice.lizard, sLizardPortrait],
	[cutscene_wait, .3],
	[cutscene_create_textbox, ["That's right."
							   ], "Frog Egg", voice.frog_egg, sFrogEggPortrait],
	[cutscene_wait, .3],
	[cutscene_create_textbox, ["And now I know why nobody comes here.",
							   "Alright, demi, here we go! This better be the best dungeon food I've ever eaten!",
							   "Afterwards you can cook me up a frog omelette!",
							   "(Ha, that worked on so many levels)"
							   ], "Rogue", voice.lizard, sLizardPortrait],						   
	[cutscene_change_camera_target, oPlayer],
	[cutscene_change_variable, oAdventurer, "startFight", true],
	[cutscene_play_sound, snd_main_theme, 2, true],
	[cutscene_resume_cooking_timeline],
]

t_skip_info = [
	[cutscene_set_x, eFrogEgg, 3197],
	[cutscene_change_camera_target, oPlayer],
	[cutscene_change_variable, oAdventurer, "startFight", true],
	[cutscene_stop_sound, snd_epic_theme],
	[cutscene_play_sound, snd_main_theme, 2, true],
	[cutscene_change_xscale, Warrior, -1],
	[cutscene_resume_cooking_timeline],
	//[cutscene_instance_create, 0, 0, "Game", oDemo],
];