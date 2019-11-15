//cutscene part 1
if (instance_exists(oPlayer) && text1) {
	var currentTrigger = instance_create_depth(0, 0, 0, oAutoTrigger);
	currentTrigger.t_scene_info = [
		[cutscene_change_global_variable, global.canMove, false],
		[cutscene_create_textbox, ["There you are! So you've decided to stay with me and cook, have you?", "A good choice. You'll be a natural in no time with that sturdy body of yours."], "Old Man", voice.oldman, sOldmanPortrait],
		[cutscene_wait, .5],
		[cutscene_create_textbox, ["#0Listen here - your #4customers#0 are risking life and limb to brave the dungeons underneath this town.", "Its your job to keep them well-fed! Your food is the difference between life and death!"], "Old Man", voice.oldman, sOldmanPortrait],
		[cutscene_create_textbox, ["But before that, you need to prove that you can navigate the dungeon's rugged landscape too."], "Old Man", voice.oldman, sOldmanPortrait],
		[cutscene_wait, .5],
		[cutscene_instance_create, 3424, 1726, "Objects", oPlayerTarget],
		[cutscene_instance_create, 2177, 1952, "Objects", oPlayerTarget],
		[cutscene_instance_create, 1507, 1375, "Objects", oPlayerTarget],
		[cutscene_instance_create, 2333, 894, "Objects", oPlayerTarget],
		[cutscene_instance_create, 3657, 1086, "Objects", oPlayerTarget],
		//[cutscene_instance_create, 0, 0, "Game", oPlayerTargetTracker],
		[cutscene_create_textbox, ["I've put some targets in this room. All you have to do is touch them.", "#0Use #3WASD#0 to #3move#0, #3SPACE#0 to #3jump#0, and #3SHIFT#0 to #3sprint#0.", "#0You #4demi#0 can also use #3RIGHT CLICK#0 to perform a #3dash#0 to increase your distance."], "Old Man", voice.oldman, sOldmanPortrait],
		
		[cutscene_change_global_variable, global.canMove, true],
	]
	currentTrigger.t_skip_info = [
		[cutscene_instance_destroy, oPlayerTarget],
		[cutscene_instance_destroy, oPlayerTargetTracker],
		[cutscene_instance_create, 3424, 1726, "Objects", oPlayerTarget],
		[cutscene_instance_create, 2177, 1952, "Objects", oPlayerTarget],
		[cutscene_instance_create, 1507, 1375, "Objects", oPlayerTarget],
		[cutscene_instance_create, 2333, 894, "Objects", oPlayerTarget],
		[cutscene_instance_create, 3657, 1086, "Objects", oPlayerTarget],
		//[cutscene_instance_create, 0, 0, "Game", oPlayerTargetTracker],		
		[cutscene_change_global_variable, global.canMove, true],
	]
	text1 = false;
	oldManText1 = false;
}	

//player must break all the targets
if (instance_exists(oPlayerTarget)) {
	tar1 = instance_position(3424, 1726, oPlayerTarget)
	tar2 = instance_position(2177, 1952, oPlayerTarget)
	tar3 = instance_position(1507, 1375, oPlayerTarget)
	tar4 = instance_position(2333, 894, oPlayerTarget)
	tar5 = instance_position(3657, 1086, oPlayerTarget)

	if (tar1 != noone and tar2 != noone and tar3 != noone) {
		if (tar1.sprite_index == sPlayerTargetGreen and tar2.sprite_index == sPlayerTargetGreen and tar3.sprite_index == sPlayerTargetGreen and tar4.sprite_index == sPlayerTargetGreen and tar5.sprite_index == sPlayerTargetGreen) {
			text2 = true;
			with(tar1) instance_destroy();
			with(tar2) instance_destroy();
			with(tar3) instance_destroy();
			with(tar4) instance_destroy();
			with(tar5) instance_destroy();
		}
	}
}

//cutscene part 2
if (text2) {
	var currentTrigger = instance_create_depth(0, 0, 0, oAutoTrigger);
	currentTrigger.t_scene_info = [
		[cutscene_change_global_variable, global.canMove, false],
		[cutscene_create_textbox, ["#0WOW! #1INCREDIBLE!#0", "#0More to come. Charles is sick and will do more when he's well."], "Old Man", voice.oldman, sOldmanPortrait],		
		[cutscene_change_global_variable, global.canMove, true],
	]
	currentTrigger.t_skip_info = [	
		[cutscene_change_global_variable, global.canMove, true],
	]
}
