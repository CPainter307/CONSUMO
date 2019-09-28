if highlighted {
	shader_set(shOutline)
	draw_self()
	shader_reset()	
} else {
	draw_self()	
}