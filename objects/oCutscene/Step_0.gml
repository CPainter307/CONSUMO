script_execute_alt(current_scene[0], current_scene_array);

//this will skip the cutscene I hope and pray wow I pray so hard
if (keyboard_check_pressed(vk_f1)) {
	create_cutscene(skip_info, skip_info);
	instance_destroy(self_id);
	instance_destroy(oTextbox);
}