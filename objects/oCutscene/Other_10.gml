
if (!cutscene_skipped) {
	current_scene = scene_info[scene];

	var len_scene = array_length_1d(current_scene) -1;

	current_scene_array = -1;
	current_scene_array = array_create(len_scene, 0);
	array_copy(current_scene_array, 0, current_scene, 1, len_scene);
}


if (cutscene_skipped) {
	current_skip = skip_info[skip];

	var len_skip = array_length_1d(current_scene) -1;

	current_skip_array = -1;
	current_skip_array = array_create(len_skip, 0);
	array_copy(current_skip_array, 0, current_skip, 1, len_skip);
}