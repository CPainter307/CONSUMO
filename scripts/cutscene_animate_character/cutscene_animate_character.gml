///@desc Animates and moves a character
///@arg character
///@arg animation
///@arg imgSpeed
///@arg xmovment
///@arg xspeed
///@arg ymovement
///@arg yspeed

var char = argument0;
var xmov = argument3;
var ymov = argument5;
var xspd = argument4;
var yspd = argument6;
char.sprite_index = argument1;
char.image_speed = argument2;

cutscene_end_action();