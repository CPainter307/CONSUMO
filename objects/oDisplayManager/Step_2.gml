#macro view view_camera[0]
field_of_view_zoom();
camera_set_view_size(view, camera_width, camera_height)

if instance_exists(following) {
	var _x = clamp(following.x - (camera_width)/2, 0, room_width-(camera_width))
	var _y = clamp(following.y - (camera_height)/2, 0, room_height-(camera_height))
	
	var _cur_x = camera_get_view_x(view)
	var _cur_y = camera_get_view_y(view)

	var _spd = .2
	camera_set_view_pos(view, lerp(_cur_x, _x, _spd), lerp(_cur_y, _y, _spd))
}