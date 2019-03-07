/// @description Insert description here
// You can write your code in this editor
/*
var vec_x = lengthdir_x(100, dir);
var vec_y = lengthdir_y(100, dir);
draw_set_color(c_red)
draw_arrow(x, y, x+vec_x, y+vec_y, 5);*/

//var dir = point_direction(x,y,mouse_x,mouse_y);
//var spd = point_distance(x,y,mouse_x,mouse_y)/10;

if (oPlayer.holdingL || oPlayer.holdingR) {
	var xx = x;
	var yy = y;

	var vx = lengthdir_x(24.5,dir);
	var vy = lengthdir_y(23.5,dir);

	var grav = 1;

	draw_primitive_begin(pr_linelist)
	draw_vertex_color(xx,yy,c_red,1)
	while(yy<room_height)
	{
	    xx+=vx;
	    yy+=vy
	    vy+=grav;
	    draw_vertex_color(xx,yy,c_lime,1)
	}
	draw_primitive_end();
}
