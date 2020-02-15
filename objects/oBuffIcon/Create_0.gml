buff_amount = "";
icon = sSwordIcon

timer = 0
max_time = 70

alpha = 1

scale_to = 5
finished_scale_up = false

_scale = 1
_scale_icon = .2

//no overlapping buff icons
while collision_circle(x, y, 30, oBuffIcon, false, true) {
	y-=1
}