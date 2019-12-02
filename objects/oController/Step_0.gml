//Campfire Code
if (global.campfire_pulse && global.campfire_pulse_occured) {	//makes sure that pulse only happens for a single step
	global.campfire_pulse = false;	
	global.campfire_pulse_occured = false;
}

//if (global.campfire_complete) {	//waits until link setup is complete
//	if (campfire_i < campfire_check) {	//counter to trigger campfire_pulse
//		campfire_i++;	
//	}
//	else {	//trigger the pulse & reset the timer
//		global.campfire_pulse = true;
//		campfire_i = 0;
//	}
//}

//Initial Campfire_Link setup code
if (!global.campfire_link_initial_setup) {	//run until initial setup is complete
	if (campfire_link_count == 0) {	//updates campfire_link_count until they are created
		campfire_link_count = instance_number(oCampfireLink);
	}
	else {	//once campfire_link_count is established
		if (global.campfire_link_i >= campfire_link_count) {	//all links have completed inital setup
			global.campfire_link_initial_setup = true;
		}
	}
}

//Pot Index Setup Tracker
if (global.campfire_link_complete && !global.campfire_complete) {	//everything but pots are ready
	if (pot_count == 0) {	//updates pot_count until they are created
		pot_count = instance_number(oPot);
	}
	else {	//once pot_count is established
		if (global.pot_i >= pot_count) {	//all pots have completed setup
			global.campfire_complete = true;	//setup is complete
		}
	}
}

//Player Target code
if (keyboard_check_pressed(ord("Y")) || (global.playerTargeti >= global.playerTargetCount && global.playerTargetCount > 0 && !global.playerTargetEventTriggered)) {
	global.playerTargetEventTriggered = true;
	show_message("You done it.");
	layer_background_change(layer_get_id("Cave1"), sDoneIt);
	instance_create_layer(x, y, "BGLayer", oDoneIt);
}