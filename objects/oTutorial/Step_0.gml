if (gamepad_is_connected(0)) {
	jumpString = "the A button";
	moveString = "the left stick";
	leftHandString = "the left bumper";
	rightHandString = "the right bumper";
	lockString = "the right trigger";
}
else {
	jumpString = "the space bar";
	moveString = "WASD";
	leftHandString = "left click";
	rightHandString = "right click";
	lockString = "shift";
}

if (instance_exists(oPlayer) && text1) {
	var currentTrigger = instance_create_depth(0, 0, 0, oAutoTrigger);
	currentTrigger.t_scene_info = [
		[cutscene_create_textbox, ["There you are! Were you going to wait all day?", "I know you're new here, but there's no time for relaxin'. Time to learn on the job."], "Old Man", voice.oldman, sOldmanPortrait],
		[cutscene_wait, .5],
		[cutscene_create_textbox, ["First let's get you nice and limber.", "Use " + moveString + " to move around and press " + jumpString + " to jump"], "Old Man", voice.oldman, sOldmanPortrait],	
		[cutscene_instance_create, 2303, 1663, "Objects", oPlayerTarget],
		[cutscene_instance_create, 3245, 1809, "Objects", oPlayerTarget],
	]
		/**
		var pTarget1 = instance_create_layer(2303, 1663, "Objects", oPlayerTarget);
		var pTarget2 = instance_create_layer(2828, 1856, "Objects", oPlayerTarget);
		var pTarget3 = instance_create_layer(3360, 1727, "Objects", oPlayerTarget);	
		pTarget1.image_xscale = 1.5;
		pTarget1.image_yscale = 1.5;
		pTarget2.image_xscale = 1.5;
		pTarget2.image_yscale = 1.5;
		pTarget3.image_xscale = 1.5;
		pTarget3.image_yscale = 1.5;
		**/
	text1 = false;
}
if (instance_exists(oPlayerTarget)) {
	tar1 = instance_position(2303, 1663, oPlayerTarget)
	tar2 = instance_position(3245, 1809, oPlayerTarget)
	if (tar1 != noone and tar2 != noone) {
		if (tar1.sprite_index == sPlayerTargetGreen and tar2.sprite_index == sPlayerTargetGreen) {
			text2 = true;
			with(tar1) instance_destroy();
			with(tar2) instance_destroy();
		}
	}
}

if (text2) {
	var currentTrigger = instance_create_depth(0, 0, 0, oAutoTrigger);
	currentTrigger.t_scene_info = [
		[cutscene_create_textbox, ["Good. Legs are done. Now show me what those arms can do, boy."], "Old Man", voice.oldman, sOldmanPortrait],
		[cutscene_wait, .5],
		[cutscene_create_textbox, ["Pick these up and throw them at my targets best you can."], "Old Man", voice.oldman, sOldmanPortrait],	
		[cutscene_create_textbox, ["Use " + leftHandString + " to hold in your left hand and " + rightHandString + " to throw in your right."], "Old Man", voice.oldman, sOldmanPortrait],	
		[cutscene_create_textbox, ["Press again to throw. Hold " + lockString +" to aim with precision."], "Old Man", voice.oldman, sOldmanPortrait],	
		[cutscene_instance_create, 2303, 1663, "Objects", oThrowTarget],
		[cutscene_instance_create, 3245, 1809, "Objects", oThrowTarget],
	]
	
	text2 = false;
}


/**
if (instance_exists(oPlayerTarget)) {
	if ((pTarget1.isHit && pTarget2.isHit && pTarget3.isHit) && text2) {
		currentTrigger = instance_create_depth(0, 0, 0, oAutoTrigger);
		currentTrigger.t_scene_info = [
			[cutscene_create_textbox, ["Good. Legs are done. Now show me what those arms can do, boy.", 
			"Pick these up and throw them at my targets best you can.", 
			"Use " + leftHandString + " to hold in your left hand and " + rightHandString + " to throw in your right.", 
			"Press again to throw. Hold " + lockString + " to aim with precision."], "Old Man", voice.oldman, sOldmanPortrait]
		];
	
		text2 = false;
	}
}

**/