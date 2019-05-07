if (!cutscene_skipped) script_execute_alt(current_scene[0], current_scene_array);

if (keyboard_check_pressed(vk_f1)) {
	cutscene_end_action();
	cutscene_skipped = true;
}


if (cutscene_skipped) {
	event_perform(ev_other, ev_user0);
	//if (instance_exists(oTextbox)) instance_destroy(oTextbox); 
	//event_perform(ev_other, ev_user0);
	script_execute_alt(current_skip[0], current_skip_array);
	
	//if (instance_exists(oTextbox)) instance_destroy(oTextbox); 
	//script_execute_alt(current_skip[0], current_skip_array);
}
/*
else {
	script_execute_alt(current_scene[0], current_scene_array);
	if (instance_exists(oTextbox)) instance_destroy(oTextbox); 

	//if (global.canMove == true) cutscene_skipped = false;
	//scr_change_camera_target(oPlayer);
	//global.canMove = true;
}*/