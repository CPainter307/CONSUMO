///@description cutscene_end_action

if (!cutscene_skipped) {
	scene++;
	if (scene > array_length_1d(scene_info)-1) {
		instance_destroy();
		exit;
	}
}

if (cutscene_skipped) {
	skip++;
	if (skip > array_length_1d(skip_info)-1) {
		instance_destroy();
		exit;
	}
}

event_perform(ev_other, ev_user0);