
////display properties
ideal_width = 0
ideal_height = 900

aspect_ratio=display_get_width()/display_get_height()

ideal_width = round(ideal_height*aspect_ratio)

//pixel perfect scaling
if display_get_width() mod ideal_width != 0 {
	var d = round(display_get_width()/ideal_width)
	ideal_width = display_get_width()/d
}
if display_get_height() mod ideal_height != 0 {
	var d = round(display_get_height()/ideal_height)
	ideal_height = display_get_height()/d
}

////check for odd numbers
//if (ideal_width & 1) {
//	ideal_width++
//} 
//if (ideal_height & 1) {
//	ideal_height++
//} 

//window_set_size(ideal_width, ideal_height)
window_set_size(display_get_width(), display_get_height())
alarm_set(0, 1)

surface_resize(application_surface, ideal_width, ideal_height)

