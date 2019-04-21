/// @description Update camera

if (!instance_exists(target)) exit;

x = lerp(x, target.x, .2)
y = lerp(y, target.y-view_h/8, .2)
//y-view_h/4
x = clamp(x, (view_w/2)+buff, room_width-(view_w/2)-buff)
y = clamp(y, (view_h/2)+buff, room_height-(view_h/2)-buff)
camera_set_view_pos(view_camera[0], x-view_w/2, y-view_h/2);

//screenshake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain-((1/shake_length)*shake_magnitude));


/*
// Update destination
if (instance_exists(follow))
{
    xTo = follow.x;
    yTo = follow.y;
}

// Update object position
x += (xTo - x) // 25;
y += (yTo - y) // 25;

// Keep camera center inside room
x = clamp(x,view_w_half+buff,room_width-view_w_half);
y = clamp(y,view_h_half+buff,room_height-view_h_half);

// Update camera view
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);

/* Parallax
To change x scrolling speed, change the x/# value. The higher the # value, the slower the scroll.
Remember, Cave2 needs to scroll the slowest and Cave6 needs to scroll the fastest.
Cave1 does not need to scroll because it is a solid color. We just stretch that image instead.
*/

if (layer_exists("Cave1"))
{
	layer_x("Cave1",x/9.5);
	layer_y("Cave1",y-view_h/2);
}

if (layer_exists("Cave2"))
{
	layer_x("Cave2",x/8);
	layer_y("Cave2",y-view_h/2);
}

if (layer_exists("Cave3"))
{
	layer_x("Cave3",x/6.5);
	layer_y("Cave3",y-view_h/2);
}

if (layer_exists("Cave4"))
{
	layer_x("Cave4",x/5);
	layer_y("Cave4",y-view_h/2);
}

if (layer_exists("Cave5"))
{
	layer_x("Cave5",x/3.5);
	layer_y("Cave5",y-view_h/2);
}

if (layer_exists("Cave6"))
{
	layer_x("Cave6",x/2);
	layer_y("Cave6",y-view_h/2);
}