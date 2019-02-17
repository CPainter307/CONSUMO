/// @description Set up camera
bg_cam = view_camera[0];
bg_follow = oPlayer;
bg_view_w_half = camera_get_view_width(bg_cam) / 2;
bg_view_h_half = camera_get_view_height(bg_cam) / 2;
bg_xTo = xstart;
bg_yTo = ystart;

bg_buff = 32;