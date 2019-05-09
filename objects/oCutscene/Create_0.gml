scene_info = -1;
skip_info = -1;
scene = 0;

self_id = id;

timer = 0;

x_dest = -1;
y_dest = -1;

myTextbox = noone;
myName = "";
myText[0] = "";

textboxPosX = (camera_get_view_width(view_camera[0])/2) - 255
textboxPosY = (camera_get_view_height(view_camera[0])) - 220

global.canMove = false;