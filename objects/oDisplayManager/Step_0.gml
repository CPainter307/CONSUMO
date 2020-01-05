if keyboard_check_pressed(ord("Z")) {
	zoom++;
	if zoom>max_zoom {
		zoom-=1
		
		camera_width = display_get_width()/zoom
		camera_height = display_get_height()/zoom
		camera_set_view_size(Main_Camera,camera_width,camera_height);
		window_set_size(camera_width, camera_height)
		surface_resize(application_surface,camera_width,camera_height);	
		window_set_fullscreen(true)
	}
	else {
		window_set_size(ideal_width*zoom, ideal_height*zoom)
		surface_resize(application_surface,ideal_width*zoom,ideal_height*zoom);	
	}
	
	alarm[1]=1
}