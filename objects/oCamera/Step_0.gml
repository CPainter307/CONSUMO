/// @description Update camera

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

//Parallax
if (layer_exists("Cave2"))
{
	layer_x("Cave2",x/8);
	layer_y("Cave2",y-view_h_half);
}

if (layer_exists("Cave3"))
{
	layer_x("Cave3",x/6.5);
	layer_y("Cave3",y-view_h_half);
}

if (layer_exists("Cave4"))
{
	layer_x("Cave4",x/5);
	layer_y("Cave4",y-view_h_half);
}

if (layer_exists("Cave5"))
{
	layer_x("Cave5",x/3.5);
	layer_y("Cave5",y-view_h_half);
}

if (layer_exists("Cave6"))
{
	layer_x("Cave6",x/2);
	layer_y("Cave6",y-view_h_half);
}