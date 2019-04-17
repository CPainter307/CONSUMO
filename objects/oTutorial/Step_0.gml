if (instance_exists(oPlayer)) {
	var currentTrigger = instance_create_depth(0, 0, 0, oAutoTrigger);
	currentTrigger.t_scene_info = [
		[cutscene_create_textbox, ["There you are! Were you going to wait all day?", "I know you're new here, but there's no time for relaxin'. Time to learn on the job."], "Old Man", voice.oldman, sLizardPortrait],
		[cutscene_wait, .5],
		[cutscene_create_textbox, ["First let's get you nice and limber.", "Use to move around and press to jump"], "Old Man", voice.oldman, sLizardPortrait],
	]
}