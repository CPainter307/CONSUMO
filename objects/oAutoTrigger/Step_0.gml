if (!instance_exists(oCutscene)) {
	create_cutscene(t_scene_info);
	instance_destroy();
}