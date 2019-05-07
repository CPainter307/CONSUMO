global.canMove = true;

if (cutscene_skipped) {
	//scr_change_camera_target(oPlayer);
	if (instance_exists(oTextbox)) instance_destroy(oTextbox);
	cutscene_skipped = false;
}
