/// @description Settings

//Set the draw colour
draw_set_colour(c_red);

//Set the font of the room
draw_set_font(fnt_lucida);

//Create surface
global.surf_surface = surface_create(room_width, room_height);

//Draw grid on surface
surface_set_target(global.surf_surface);
var a;
for(a = 0;a <= room_width;a += 32){
    draw_line_colour(a, 0, a, room_height, c_white, c_white);
}
for(a = 0;a <= room_height;a += 32){
    draw_line_colour(0, a, room_width, a, c_white, c_white);
}
surface_reset_target();

