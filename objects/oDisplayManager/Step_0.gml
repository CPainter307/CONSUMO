following = global.in_control
if keyboard_check_pressed(ord("Z")) {
	zoom ++;
	if zoom>max_zoom {
		zoom = max_zoom
		
		camera_width = display_get_width()/zoom
		camera_height = display_get_height()/zoom
		camera_set_view_size(Main_Camera,camera_width,camera_height);
		window_set_size(camera_width, camera_height)
		surface_resize(application_surface,camera_width,camera_height);	
		window_set_fullscreen(true)
	}
	
	else {
		window_set_size(ideal_width*zoom, ideal_height*zoom)
		display_set_gui_size(ideal_width*zoom,ideal_height*zoom);
		surface_resize(application_surface,ideal_width*zoom,ideal_height*zoom);	
	}
	
	
	alarm[1]=1
}

if keyboard_check_pressed(ord("X")) {
	zoom--;
	window_set_fullscreen(false)
	if zoom < min_zoom {
		zoom++;
		
		//screen_size_zoom();
	}
	
	else {
		window_set_size(ideal_width*zoom, ideal_height*zoom)
		display_set_gui_size(ideal_width*zoom,ideal_height*zoom);
		surface_resize(application_surface,ideal_width*zoom,ideal_height*zoom);	
	}
	
	
	alarm[1]=1
}
