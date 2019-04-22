for (var i = gp_face1; i < gp_axisrv; i++) {
	if (gamepad_button_check(0, i)) {
		global.last_button = i;
		return global.last_button;
	}
}
return global.last_button;