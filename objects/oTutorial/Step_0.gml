if (instance_exists(oPlayer) && text1) {
	var currentTrigger = instance_create_depth(0, 0, 0, oAutoTrigger);
	currentTrigger.t_scene_info = [
		[cutscene_create_textbox, ["There you are! Were you going to wait all day?", "I know you're new here, but there's no time for relaxin'. Time to learn on the job."], "Old Man", voice.oldman, sOldmanPortrait],
		[cutscene_wait, .5],
		[cutscene_create_textbox, ["First let's get you nice and limber.", "Use " + moveString + " to move around and press " + jumpString + " to jump."], "Old Man", voice.oldman, sOldmanPortrait],
		[cutscene_instance_create, 2303, 1663, "Objects", oPlayerTarget],
		[cutscene_instance_create, 3245, 1809, "Objects", oPlayerTarget],
		[cutscene_instance_create, 2828, 1856, "Objects", oPlayerTarget],
		[cutscene_instance_create, 0, 0, "Game", oPlayerTargetTracker]
	]
	text1 = false;
}

if (instance_exists(oPlayerTarget)) {
	tar1 = instance_position(2303, 1663, oPlayerTarget)
	tar2 = instance_position(3245, 1809, oPlayerTarget)
	tar3 = instance_position(2828, 1856, oPlayerTarget)

	if (tar1 != noone and tar2 != noone and tar3 != noone) {
		if (tar1.sprite_index == sPlayerTargetGreen and tar2.sprite_index == sPlayerTargetGreen and tar3.sprite_index == sPlayerTargetGreen) {
			text2 = true;
			instance_destroy(oPlayerTargetTracker);
			with(tar1) instance_destroy();
			with(tar2) instance_destroy();
			with(tar3) instance_destroy();
		}
	}
}

if (text2) {
	var currentTrigger = instance_create_depth(0, 0, 0, oAutoTrigger);
	currentTrigger.t_scene_info = [
		[cutscene_create_textbox, ["Good. Legs are done. Now show me what those arms can do, boy.","Pick these up and throw them at my targets best you can."], "Old Man", voice.oldman, sOldmanPortrait],
		//[cutscene_create_textbox, [], "Old Man", voice.oldman, sOldmanPortrait],
		[cutscene_wait, .5],
		[cutscene_instance_create, 2751, 1982, "Objects", oPebble],
		[cutscene_instance_create, 2856, 1984, "Objects", oPebble],
		[cutscene_create_textbox, ["Use " + leftHandString + " to hold in your left hand and " + rightHandString + " to hold in your right.","Press again to throw. Hold " + lockString +" to aim with precision."], "Old Man", voice.oldman, sOldmanPortrait],	
		//[cutscene_create_textbox, [], "Old Man", voice.oldman, sOldmanPortrait],	
		[cutscene_instance_create, 2303, 1663, "Objects", oThrowTarget],
		[cutscene_instance_create, 3245, 1809, "Objects", oThrowTarget],
		[cutscene_instance_create, 2744, 1758, "Objects", oThrowTarget],
		[cutscene_instance_create, 0, 0, "Game", oThrowTargetTracker],
	]
	text2 = false;
}

if (instance_exists(oThrowTarget)) {
	tar1 = instance_position(2303, 1663, oThrowTarget)
	tar2 = instance_position(3245, 1809, oThrowTarget)
	tar3 = instance_position(2744, 1758, oThrowTarget)

	if (tar1 != noone and tar2 != noone and tar3 != noone) {
		if (tar1.isHit and tar2.isHit and tar3.isHit) {
			text3 = true;
			instance_destroy(oThrowTargetTracker);
			with(tar1) instance_destroy();
			with(tar2) instance_destroy();
			with(tar3) instance_destroy();
		}
	}
}

if (text3) {
	var currentTrigger = instance_create_depth(0, 0, 0, oAutoTrigger);
	currentTrigger.t_scene_info = [
		[cutscene_instance_destroy, oPebble],
		[cutscene_create_textbox, ["Alright good. You're looking nice and warm, boy. Now, let's go over cooking.",
								   "What, surprised? Trust me, you're still gonna be learning on the job.",
								   "Your client is gonna be doing the hard work out there and he's gonna be hungry.",
								   "Not only will the food you prepare for him heal him up good, it's the difference between life and death."],
								   "Old Man", voice.oldman, sOldmanPortrait],
		[cutscene_instance_create, 2751, 1982, "Cooking", oMeat],
		[cutscene_instance_create, 2463, 2016, "Pot", oPot],
		[cutscene_instance_create, 2463, 2006, "RadiusAndRunes", oPotRadius],
		[cutscene_instance_create, 0, 0, "Game", oRecipeTracker],
		[cutscene_wait, .5],
		[cutscene_create_textbox, ["Every ingredient has a different property. For instance, this hearty meat can heal wounds.",
								   "But your client isn't going to eat this raw. If he does he'll lower our health rating."], "Old Man", voice.oldman, sOldmanPortrait],
		[cutscene_wait, .5],
		[cutscene_create_textbox, ["..."], "Old Man", voice.oldman, sOldmanPortrait],
		[cutscene_wait, .5],
		[cutscene_create_textbox, ["That was just a joke! Our rating's already in the negatives.",
								   "Anyways, you'll have to cook this up before they eat it.",
								   "Throw this in the pot and it'll cook.",
								   "Take it too early and raw food will hurt your client. Too long it'll burn and lose potency. Wait till it's just right.",
								   "A true cook can tell!"], "Old Man", voice.oldman, sOldmanPortrait],
	]
	
	oPlayerPickUpRadius.itemInLeftHand = noone;
	oPlayerPickUpRadius.itemInRightHand = noone;
	
	text3 = false;
}

if (instance_exists(oRecipeTracker)) {
	if (oRecipeTracker.raw) {
		instance_destroy(oRecipeTracker);
		var currentTrigger = instance_create_depth(0, 0, 0, oAutoTrigger);
		currentTrigger.t_scene_info = [
			[cutscene_wait, 2],
			[cutscene_instance_destroy, oRecipe],
			[cutscene_create_textbox, ["Too early! That meat's still trying to graze in the meadow! Again!"], "Old Man", voice.oldman, sOldmanPortrait],
			[cutscene_instance_create, 2751, 1982, "Cooking", oMeat],
			[cutscene_instance_create, 0, 0, "Game", oRecipeTracker],
		]
		oPlayerPickUpRadius.itemInLeftHand = noone;
		oPlayerPickUpRadius.itemInRightHand = noone;
	} else if (oRecipeTracker.undercooked) {
		instance_destroy(oRecipeTracker);
		var currentTrigger = instance_create_depth(0, 0, 0, oAutoTrigger);
		currentTrigger.t_scene_info = [
			[cutscene_wait, 2],
			[cutscene_instance_destroy, oRecipe],
			[cutscene_instance_destroy, oRecipeTracker],
			[cutscene_create_textbox, ["Close, boy! Pulled it a little too early, but it'll do. Here's an insider secret: the steam will start to shimmer when it's JUST right."], "Old Man", voice.oldman, sOldmanPortrait],
			
		]
		oPlayerPickUpRadius.itemInLeftHand = noone;
		oPlayerPickUpRadius.itemInRightHand = noone;
		text4 = true;
	} else if (oRecipeTracker.perfect) {
		instance_destroy(oRecipeTracker);
		var currentTrigger = instance_create_depth(0, 0, 0, oAutoTrigger);
		currentTrigger.t_scene_info = [
			[cutscene_wait, 2],
			[cutscene_instance_destroy, oRecipe],
			[cutscene_instance_destroy, oRecipeTracker],
			[cutscene_create_textbox, ["Now that's what I'm talking about! Perfectly cooked! I knew I hired you for a reason, boy!"], "Old Man", voice.oldman, sOldmanPortrait],
		]
		oPlayerPickUpRadius.itemInLeftHand = noone;
		oPlayerPickUpRadius.itemInRightHand = noone;
		text4 = true;
	} else if (oRecipeTracker.burnt) {
		instance_destroy(oRecipeTracker);
		var currentTrigger = instance_create_depth(0, 0, 0, oAutoTrigger);
		currentTrigger.t_scene_info = [
			[cutscene_wait, 2],
			[cutscene_instance_destroy, oRecipe],
			[cutscene_create_textbox, ["Great job boy, that's the exact chunk of charcoal I needed for my fireplace!","Oh, wait, I wanted food. Again!"], "Old Man", voice.oldman, sOldmanPortrait],
			[cutscene_instance_create, 2751, 1982, "Cooking", oMeat],
			[cutscene_instance_create, 0, 0, "Game", oRecipeTracker],
		]
		oPlayerPickUpRadius.itemInLeftHand = noone;
		oPlayerPickUpRadius.itemInRightHand = noone;
	}
}

if (text4) {
	var currentTrigger = instance_create_depth(0, 0, 0, oAutoTrigger);
	currentTrigger.t_scene_info = [
		[cutscene_wait, .5],
		[cutscene_create_textbox, ["Congratulations, you've cooked up some boiled meat!",
								   "What's that? You aren't appetized?",
								   "Of course not! It's hot wet meat! You can't call this cooking!",
								   "Listen up, the meat you just cooked is a whole ingredient. Throw that in the pot and it'll just cook itself.",
								   "If you prepare an ingredient beforehand, you can throw three into the pot before they'll start cooking!",
		], "Old Man", voice.oldman, sOldmanPortrait],
		[cutscene_wait, .5],
		[cutscene_instance_create, 3102, 1982, "Objects", oMeat],
		[cutscene_instance_create, 2856, 1984, "Objects", oOnion],
		[cutscene_instance_create, 3010, 1984, "Objects", oSalt],
		[cutscene_instance_create, 2676, 1979, "Cooking", oNewPrepTable],
		[cutscene_create_textbox, ["Throw those on the table then use " + chopString + " to chop them up. Then cook them into a dish!",
		], "Old Man", voice.oldman, sOldmanPortrait],
		[cutscene_instance_destroy, oRecipe],
		[cutscene_change_variable, oTutorial, "text5", true],
	]
	
	oPlayerPickUpRadius.itemInLeftHand = noone;
	oPlayerPickUpRadius.itemInRightHand = noone;
	text4 = false;
}

if (instance_exists(oRecipe) && text5) {

	var inst = instance_nearest(x, y, oRecipe);
	if (string_pos("Soup", inst.name) != 0) {
		var currentTrigger = instance_create_depth(0, 0, 0, oAutoTrigger);
		currentTrigger.t_scene_info = [
			[cutscene_wait, 2],
			[cutscene_create_textbox, ["Well, you did it. Your first meal. I'm proud of you boy.",
			], "Old Man", voice.oldman, sOldmanPortrait],
			[cutscene_wait, .5],
			[cutscene_create_textbox, ["Let's see, anything I'm forgetting?",
									   "Oh! Remember you can't take anything out of a pot unless it's started cooking in there, so be careful!",
									   "And remember the most important rule.",
									   "Keep the client alive!",
									   "You've got this boy! And if you don't, there won't be anyone to protect you from the monsters anyways, so at least it'll all be over.",
									   "Good luck!"
			], "Old Man", voice.oldman, sOldmanPortrait],
		]
		text5 = false;
	}
	if (string_pos("Soup", inst.name) == 0) {
		var currentTrigger = instance_create_depth(0, 0, 0, oAutoTrigger);
			currentTrigger.t_scene_info = [
				[cutscene_wait, 2],
				[cutscene_instance_destroy, oRecipe],
				[cutscene_instance_destroy, oIngredient],
				[cutscene_instance_create, 3102, 1982, "Objects", oMeat],
				[cutscene_instance_create, 2856, 1984, "Objects", oOnion],
				[cutscene_instance_create, 3010, 1984, "Objects", oSalt],
				[cutscene_change_variable, oTutorial, "text5", true],
				[cutscene_change_variable, oPlayerPickUpRadius, "itemInLeftHand", noone],
				[cutscene_change_variable, oPlayerPickUpRadius, "itemInRightHand", noone],
				[cutscene_create_textbox, ["Boy, I told you to cook all three of them! You've just thrown a whole ingredient in the pot!",
										   "Take the ingredients to the table and chop all three of them, then put them in!",
										   "Kids these days..."
				], "Old Man", voice.oldman, sOldmanPortrait],

			]
			
		text5 = false;
		//oPlayerPickUpRadius.itemInLeftHand = noone;
		//oPlayerPickUpRadius.itemInRightHand = noone;
		if (instance_exists(oNewPrepTable)) { 
			oNewPrepTable.ingr1 = noone;
			oNewPrepTable.ingr2 = noone;
			oNewPrepTable.ingr3 = noone;
		}
	}
	text6 = true;
}
if (text6) {
	instance_create_layer(3289, 1922, "Walls", oDoor)
	text6 = false;
}

//resize your pebbs
if instance_exists(oIngredient) {
	oIngredient.image_xscale = 0.5;
	oIngredient.image_yscale = 0.5;
}