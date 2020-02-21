/// @description Settings

var xx, yy;

//Snap me to the grid
x = round(x / 32) * 32;
y = round(y / 32) * 32;

//Move me to the center of the square of the grid
xx = sign(mouse_x - x);
yy = sign(mouse_y - y);
if (xx <> 0){
    x += xx * 16;
}else{
    x += choose(-16, 16);
}
if (yy <> 0){
    y += yy * 16;
}else{
    y += choose(-16, 16);
}

//Destroy self if there is already an obstacle here
if (place_meeting(x, y, obj_obstacle)){
    instance_destroy();
}

