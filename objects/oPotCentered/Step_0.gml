//pulse code
if (global.campfire_pulse) {
	//advance campfire index
	if (campfire_index+1 < array_length_1d(global.campfire_list)) { //if true then currently not on last index
		campfire_index++;	
	}
	else {	//currently on last index
		campfire_index = 0;
	}
	
	//change pot location
	var campfireID = global.campfire_list[campfire_index];
	x = campfireID.x;
	y = campfireID.y;
}

//set pot indexes
if (!global.campfire_complete && global.campfire_link_complete) {	//everything is ready except the pot indexes
	var inst = instance_place(x, y, oCampfire);
	campfire_index = inst.index;
	global.pot_i++;
}