/// @description Draws throwing line from Hacky (eventually)
// You can write your code in this editor
if ((oPlayerPickUpRadius.itemInLeftHand != noone || oPlayerPickUpRadius.itemInRightHand != noone)) {
	if (oPlayerInput.key_up || oPlayerInput.key_down || oPlayerInput.key_right || oPlayerInput.key_left) {
		oHacky.sprite_index = sHackyChomp;
	}
}

if ((oPlayerPickUpRadius.itemInLeftHand != noone || oPlayerPickUpRadius.itemInRightHand != noone) && oPlayer.isLocked) {
	var xx = oPlayer.x;
	var yy = oPlayer.y;
	oHacky.sprite_index = sHackyChomp;

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
