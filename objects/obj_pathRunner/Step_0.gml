/// @description Meat and potatoes

//Create a path to this place
if (mouse_check_button_pressed(mb_left)){
    scr_createPath(x, y, mouse_x, mouse_y, 32, 8, true, obj_obstacle, false);
}

//Create obstacles
if (mouse_check_button(mb_right)){
    instance_create(mouse_x, mouse_y, obj_obstacle);
}

//Restart room
if (keyboard_check_pressed(vk_space)){
    room_restart();
}

//Move character
var a = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var b = keyboard_check(ord("S")) - keyboard_check(ord("W"));
x += a * 2;
y += b * 2;
if (place_meeting(x, y, obj_obstacle)){
    while(place_meeting(x, y, obj_obstacle)){
        x += -a;
        y += -b;
    }
}
        


