//no overlapping buff icons
if !draw_gui {
	while collision_circle(x, y, 30, oBuffIcon, false, true) {
		y-=1
	}
}