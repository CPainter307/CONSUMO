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
		
		if (inst.prepared) {
			//positions objects and changes speed
			if (target_type == targ_type.pass) {
				//do nothing	
			}
			else if (target_type == targ_type.fall && !inst.in_target) {
				//repositions object to center of target
				inst.phy_position_x = x;
				inst.phy_position_y = y;
				//sets object speed to 0 and direction to down
				inst.phy_speed_x = 0;
				inst.phy_speed_y = 0;
			}
			else if (target_type == targ_type.launch && !inst.in_target) {
				//repositions object to center of target
				inst.phy_position_x = x;
				inst.phy_position_y = y;
				//sets object speed to launch speed at appropriate 8 axis angle
				switch (image_angle) {
					case 0:
						inst.phy_speed_x = launch_speed;
						inst.phy_speed_y = 0;
						break;
					case 45:
						inst.phy_speed_x = launch_speed/(sqrt(2));
						inst.phy_speed_y = -launch_speed/(sqrt(2));
						break;
					case 90:
						inst.phy_speed_x = 0;
						inst.phy_speed_y = -launch_speed;
						break;
					case 135:
						inst.phy_speed_x = -launch_speed/(sqrt(2));
						inst.phy_speed_y = -launch_speed/(sqrt(2));
						break;
					case 180:
						inst.phy_speed_x = -launch_speed;
						inst.phy_speed_y = 0;
						break;
					case 225:
						inst.phy_speed_x = -launch_speed/(sqrt(2));
						inst.phy_speed_y = launch_speed/(sqrt(2));
						break;
					case 270:
						inst.phy_speed_x = 0;
						inst.phy_speed_y = launch_speed;
						break;
					case 315:
						inst.phy_speed_x = launch_speed/(sqrt(2));
						inst.phy_speed_y = launch_speed/(sqrt(2));
						break;
					default:
						//do nothing
				}
			}
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

