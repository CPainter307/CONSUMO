//pebble tracking
if (instance_exists(oPebble)) {
	pebbles_exist = true;
}
else {
	pebbles_exist = false;
}

//cutscene part 1
if (instance_exists(oPlayer) && text1) {
	var currentTrigger = instance_create_depth(0, 0, 0, oAutoTrigger);
	currentTrigger.t_scene_info = [
		[cutscene_change_global_variable, global.canMove, false],
		[cutscene_change_camera_target, oOldman],
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
		[cutscene_create_textbox, ["I've put some targets in this room. All you have to do is touch them.", "#0Use #3WASD#0 to #3move#0, #3SPACE#0 to #3jump#0, and #3SHIFT#0 to #3sprint#0.", "#0You #4demi#0 can also use #3RIGHT CLICK#0 to perform a #3dash#0 to increase your distance."], "Old Man", voice.oldman, sOldmanPortrait],
		
		[cutscene_change_global_variable, global.canMove, true],
		[cutscene_change_camera_target, oPlayer]
	]
	currentTrigger.t_skip_info = [
		[cutscene_instance_destroy, oPlayerTarget],
		[cutscene_instance_destroy, oPlayerTargetTracker],
		[cutscene_instance_create, 3424, 1726, "Objects", oPlayerTarget],
		[cutscene_instance_create, 2177, 1952, "Objects", oPlayerTarget],
		[cutscene_instance_create, 1507, 1375, "Objects", oPlayerTarget],
		[cutscene_instance_create, 2333, 894, "Objects", oPlayerTarget],
		[cutscene_instance_create, 3657, 1086, "Objects", oPlayerTarget],		
		[cutscene_change_global_variable, global.canMove, true],
		[cutscene_change_camera_target, oPlayer]
	]
	text1 = false;
	oldManText1 = true; 
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
		[cutscene_change_camera_target, oOldman],
		[cutscene_create_textbox, ["Not bad at all. I was just as limber myself back in the day. Had two legs, too.", "But you aren't here to be a gymnast, boy. At least, not exclusively.", "That is to say - you won't be waiting tables."], "Old Man", voice.oldman, sOldmanPortrait],		
		[cutscene_create_textbox, ["#0No, in the heat of battle it's best to #3throw#0 the food to your #4customers#0!"], "Old Man", voice.oldman, sOldmanPortrait],
		[cutscene_wait, 1],
		[cutscene_create_textbox, ["..."], "Old Man", voice.oldman, sOldmanPortrait],
		[cutscene_wait, 1],
		[cutscene_create_textbox, ["#0No, really! They can catch it! They're #4adventurers#0, after all.", "#0So let's see how you do it. Come on over here and press #3E#0 to #3pick up#0 these pebbles." ], "Old Man", voice.oldman, sOldmanPortrait],
		[cutscene_instance_create, 2560, 1982, "Objects", oPebble],
		[cutscene_instance_create, 2606, 1982, "Objects", oPebble],
		[cutscene_instance_create, 2484, 1982, "Objects", oPebble],
		[cutscene_change_variable, oNewTutorial, "text3", true],
		[cutscene_change_global_variable, global.canMove, true],	
		[cutscene_change_camera_target, oPlayer]
	]
	currentTrigger.t_skip_info = [	
		[cutscene_instance_create, 2560, 1982, "Objects", oPebble],
		[cutscene_instance_create, 2606, 1982, "Objects", oPebble],
		[cutscene_instance_create, 2484, 1982, "Objects", oPebble],
		[cutscene_change_variable, oNewTutorial, "text3", true],
		[cutscene_change_global_variable, global.canMove, true],
		[cutscene_change_camera_target, oPlayer]
	]
	oldManText1 = false;
	text2 = false;
	oldManText2 = true;
}

//the player must collect all pebbles

//cutscene part 3
if (text3 && !pebbles_exist) {
	var currentTrigger = instance_create_depth(0, 0, 0, oAutoTrigger);
	currentTrigger.t_scene_info = [
			[cutscene_change_global_variable, global.canMove, false],
			[cutscene_change_camera_target, oOldman],
			[cutscene_create_textbox, ["#0Mmm, nice, smooth #2pebbles#0. Perfect for skipping over the face of the water.", "#0You've got those #2pebbles#0 stored in your #3pouch#0 I see."], "Old Man", voice.oldman, sOldmanPortrait],		
			[cutscene_create_textbox, ["#0Why not press #3Q#0 to #3open it up#0?"], "Old Man", voice.oldman, sOldmanPortrait],
			[cutscene_change_variable, oNewTutorial, "text4", true],
			[cutscene_change_global_variable, global.canMove, true],	
			[cutscene_change_camera_target, oPlayer]
		]
		currentTrigger.t_skip_info = [	
			[cutscene_change_global_variable, global.canMove, true],
			[cutscene_change_variable, oNewTutorial, "text4", true],
			[cutscene_change_camera_target, oPlayer]
		]
		oldManText2 = false;
		text3 = false;
		oldManText3 = true;
}

//the player must open their inventory

//cutscene part 4
if (text4 && oPlayerInventory.show_inventory) {
	//IMPORTANT!!! Players need to not be able to manipulate their inventory during this part. Idk how we'll do that, though.
	var currentTrigger = instance_create_depth(0, 0, 0, oAutoTrigger);
	currentTrigger.t_scene_info = [
			[cutscene_change_global_variable, global.canMove, false],
			[cutscene_change_camera_target, oOldman],
			[cutscene_create_textbox, ["#0This is the inside of your #3pouch#0. To select what you want to hold, #3hover over it#0.", "#0Every item has #2stats#0 on them. You can see the item's name and stats by #3hovering over it with your mouse.#0"], "Old Man", voice.oldman, sOldmanPortrait],		
			[cutscene_create_textbox, ["#0As you'll see these #2pebbles#0 have no #2stats#0. Not a mite of nutrition to be found.", "#0Why not use #3LEFT CLICK#0 to hold them in your throwing hand?"], "Old Man", voice.oldman, sOldmanPortrait],		
			[cutscene_change_variable, oNewTutorial, "text5", true],
			[cutscene_change_global_variable, global.canMove, true],	
			[cutscene_change_camera_target, oPlayer]
		]
		currentTrigger.t_skip_info = [	
			[cutscene_change_global_variable, global.canMove, true],
			[cutscene_change_variable, oNewTutorial, "text5", true],
			[cutscene_change_camera_target, oPlayer]
		]
		oldManText3 = false;
		text4 = false;
		oldManText4 = true;
}

//the player must equip the pebbles in their throwing hand

//cutscene part 5
if (text5 && (oPlayerInventory.pickup_slot != -1)) {
	var currentTrigger = instance_create_depth(0, 0, 0, oAutoTrigger);
	currentTrigger.t_scene_info = [
			[cutscene_change_global_variable, global.canMove, false],
			[cutscene_change_camera_target, oOldman],
			[cutscene_create_textbox, ["#0Nice. You're locked in ready. I'd also reccomend closing your #2pouch#0", "#0While you're #3holding#0 an #2item#0 you can press #3LEFT CLICK#0 to #3throw#0 it in the direction of your #3mouse#0.", "Try giving these targets a hit, boy! Show me what you're made of!"], "Old Man", voice.oldman, sOldmanPortrait],		
			[cutscene_instance_create, 2753, 1762, "Objects", oThrowTarget],
			[cutscene_instance_create, 3666, 1374, "Objects", oThrowTarget],
			[cutscene_instance_create, 2344, 799, "Objects", oThrowTarget],
			[cutscene_instance_create, 2000, 1490, "Objects", oThrowTarget],
			[cutscene_change_global_variable, global.canMove, true],	
			[cutscene_change_camera_target, oPlayer]
		]
		currentTrigger.t_skip_info = [	
			[cutscene_change_global_variable, global.canMove, true],
			[cutscene_instance_create, 2753, 1762, "Objects", oThrowTarget],
			[cutscene_instance_create, 3666, 1374, "Objects", oThrowTarget],
			[cutscene_instance_create, 2344, 799, "Objects", oThrowTarget],
			[cutscene_instance_create, 2000, 1490, "Objects", oThrowTarget],
			[cutscene_change_camera_target, oPlayer]
		]
		oldManText4 = false;
		text5 = false;
		oldManText5 = true;	
}

//the player must strike all the targets with pebbles
if (instance_exists(oThrowTarget)) {
	tar1 = instance_position(2753, 1762, oThrowTarget)
	tar2 = instance_position(3666, 1374, oThrowTarget)
	tar3 = instance_position(2344, 799, oThrowTarget)
	tar4 = instance_position(2000, 1490, oThrowTarget)

	if (tar1 != noone and tar2 != noone and tar3 != noone and tar4 != noone) {
		if (tar1.sprite_index == sTargetGreen and tar2.sprite_index == sTargetGreen and tar3.sprite_index == sTargetGreen and tar4.sprite_index == sTargetGreen) {
			text6 = true;
			with(tar1) instance_destroy();
			with(tar2) instance_destroy();
			with(tar3) instance_destroy();
			with(tar4) instance_destroy();
		}
	}
}

//cutscene part 6
if (text6) {
	var currentTrigger = instance_create_depth(0, 0, 0, oAutoTrigger);
	currentTrigger.t_scene_info = [
			[cutscene_change_global_variable, global.canMove, false],
			[cutscene_change_camera_target, oOldman],
			[cutscene_create_textbox, ["Not bad at all! You may have the workings of a true chef in you after all, boy!"], "Old Man", voice.oldman, sOldmanPortrait],
			[cutscene_wait, 1],
			[cutscene_create_textbox, ["Just kidding, we haven't even talked about food yet!"], "Old Man", voice.oldman, sOldmanPortrait],
			[cutscene_change_variable, oNewTutorial, "text7", true],
			[cutscene_change_global_variable, global.canMove, true],	
			[cutscene_change_camera_target, oPlayer]
		]
		currentTrigger.t_skip_info = [	
			[cutscene_change_global_variable, global.canMove, true],
			[cutscene_change_variable, oNewTutorial, "text7", true],
			[cutscene_change_camera_target, oPlayer]
		]
		oldManText5 = false;
		text6 = false;
		oldManText6 = true;	
}

