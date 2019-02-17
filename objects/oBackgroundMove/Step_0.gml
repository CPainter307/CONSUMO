// Update destination
if (instance_exists(bg_follow))
{
    bg_xTo = bg_follow.x;
    bg_yTo = bg_follow.y;
}

// Update object position
x += (bg_xTo - x) // 25;
y += (bg_yTo - y) // 25;

// Keep camera center inside room
x = clamp(x,bg_view_w_half+bg_buff,room_width-bg_view_w_half);
y = clamp(y,bg_view_h_half+bg_buff,room_height-bg_view_h_half);

// Update camera view
camera_set_view_pos(bg_cam,x-bg_view_w_half,y-bg_view_h_half);