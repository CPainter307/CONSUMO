if keyboard_check_pressed(ord("S")) {
     /// Reset all variable when we build a new path because enemy might be in path when we press S
     speed_h = 0;
     speed_v = 0;
     if path_exists(path_building) {
         path_delete (path_building);
     }
     path_point = 0 ;
     action = 0 ;
     jump_action = 0 ;

    scr_fill_the_grid(floor(x/oGrid.cell_width), floor(y/oGrid.cell_height), floor(oPlayer.x/oGrid.cell_width), floor((oPlayer.y+44-8)/oGrid.cell_height));
}

// Follow the path if path exists
if path_exists(path_building) {
    scr_follow_the_path(path_building);
}

if !place_meeting(x, y+1, oCollidable) {
	speed_v = speed_v + game_gravity	
}
//Collision horizontal with object Collision
if place_meeting(x+speed_h, y, oCollidable) {
    while !place_meeting(x+sign(speed_h), y, oCollidable) {
        x += sign(speed_h);
    }
    speed_h = 0;
}
x += speed_h;

// Collision vertical with object Collision
if place_meeting(x, y+speed_v, oCollidable) {
    while !place_meeting(x, y+sign(speed_v), oCollidable) {
        y += sign(speed_v);
    }
    speed_v = 0;
}
y += speed_v;