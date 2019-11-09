//collision check and sound play
if (place_meeting(x, y, oIngredient)) {	//if object collides
	//checks for each instance in case there's multiple
	var inst_list = ds_list_create();
	instance_place_list(x, y, oIngredient, inst_list, false);
	for (i = 0; i < ds_list_size(inst_list); i++) {	//runs for each instance of oHoldableObject
		var inst = inst_list[| i];
		
		//preps objects
		if (white_list[0] != pointer_null) {	//if white_list doesn't contain pointer_null then check stuff
			for (j = 0; j < array_length_1d(white_list); j++) {
				if (inst.enum_type == white_list[j]) {	//if on whitelist then prep
					inst.prepared = true;
				}
			}
		}
		else {	//white_list contains pointer_null so prep everything
			inst.prepared = true;
		}
		
		//positions objects
		if (target_type == targ_type.pass) {
			//do nothing	
		}
		
		//play sound
		if (inst.prepared && !inst.in_target) {
			audio_play_sound(snd_target_hit, 0, false);
			inst.in_target = true;
		}
	}
	
	//garbage collection
	ds_list_destroy(inst_list);
}

