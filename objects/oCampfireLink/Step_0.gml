//	//garbage collection
//	ds_list_destroy(inst_list);

//runs initial setup
if (!initial_setup) {
	//check red
	if (position_meeting(x, y, oCampfire)) {
		camp_red = instance_position(x, y, oCampfire);
		camp_red.red_present = true;
		
		//temp check code
		if (debug) {
			camp_red.sprite_index = sCampfireSmallHighlight;
		}
	}

	//check green
	var x_green_dis = lengthdir_x(sprite_width, image_angle);
	var y_green_dis = lengthdir_y(sprite_width, image_angle);
	
	//if (image_angle < 90) {
	//	y_green_dis = y_green_dis*-1;
	//}
	//else if (image_angle < 180) {
	//	x_green_dis = x_green_dis*-1;	
	//	y_green_dis = y_green_dis*-1;
	//}
	//else if (image_angle < 270) {
	//	x_green_dis = x_green_dis*-1;
	//}
	
	if (position_meeting(x+x_green_dis, y+y_green_dis, oCampfire)) {
		camp_green = instance_position(x+x_green_dis, y+y_green_dis, oCampfire);
		camp_green.green_present = true;
		
		//temp check code
		if (debug) {
			camp_green.sprite_index = sCampfireSmallHighlight;
		}
	}
	
	//mark initial setup
	initial_setup = true;
	global.campfire_link_i++;	//increment to show that a link has completed inital setup
}



//Run after all initial setup
if (global.campfire_link_initial_setup && !complete) {
	if (camp_red != pointer_null) {	//true if red is on campfire
		//Stores first campfire ID
		if (camp_red.red_present == true && camp_red.green_present == false) {	//true if first campfire (first campfire should be the only one that only has red)
			//Store First Campfire
			global.campfire_list[global.campfire_list_i] = camp_red;
			camp_red.in_target = global.campfire_list_i;
			global.campfire_list_i++;
			camp_red.complete = true;
		}
		
		if (camp_green != pointer_null) {	//true if green is also on campfire
			if (camp_green.red_present == true && camp_green.green_present == true) {	//true if intermediate campfire
				if (camp_red.complete && !camp_green.complete) {	//red camp has been stored but green hasn't (next camp)
					//Store Campfire
					global.campfire_list[global.campfire_list_i] = camp_green;
					camp_green.index = global.campfire_list_i;
					global.campfire_list_i++;
					camp_green.complete = true;
					//Link is complete
					complete = true;
				}
			}
			else if (camp_green.red_present == false && camp_green.green_present == true) {	//true if last camp (only touched by green; not by red)
				if (camp_red.complete) {	//only runs if red camp (previous camp) is complete (otherwise we're not at the end yet)
					//Store Last Campfire
					global.campfire_list[global.campfire_list_i] = camp_green;
					camp_green.index = global.campfire_list_i;
					global.campfire_list_i++;
					camp_green.complete = true;
					//Link is complete
					complete = true;
					//Final Link is complete
					global.campfire_link_complete = true;
				}
			}
		}
	}
}
