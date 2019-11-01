var direction8 = global.direction8;
xx = oPlayer.x
yy = oPlayer.y
damp = 0.9967

//draw_self();
//figure the mouse dir and distance for aiming and force
 dir = point_direction(xx, yy, mouse_x, mouse_y);
 spd = 20;
//start at x,y of launcher, (my sprite has the origns in the middle of the Y part of the sling)
empty = true;
//what are the dx,dy for movement
	if (direction8) {
		var dir8 = scr_get_8_dir();
			switch (dir8) {
				case direc.right:
					dir = 0;
					break;
				case direc.up_right:
					dir = 45;
					break;
				case direc.up:
					dir = 90;
					break;
				case direc.up_left:
					dir = 135;
					break;
				case direc.left:
					dir = 180;
					break;
				case direc.down_left:
					dir = 225;
					break;
				case direc.down:
					dir = 270
					break;
				case direc.down_right:
					dir = 315;
					break;
				default:
					dir = 270;
					// Had to make this do something. Otherwise, a heavy throw with no directional input would shoot our character into the stratosphere
			}
}
vx = lengthdir_x(spd,dir);
vy = lengthdir_y(spd,dir);
//the gravity
grav = 0.25; 
//dragging, draw the lineif(mouse_check_button(mb_left))
count = 0;

    draw_primitive_begin(pr_linelist)
    draw_vertex_color(xx,yy,c_lime,1)
    //while(0<yy<500)
	while(empty)
    {
		count++
		if (count >= 300) {
			empty = false;	
		}
		//dir = point_direction(xx, yy, xx + vx, yy + vy)
        xx+=vx; //add dx
        yy+=vy; //add dy
        vy+= grav; //add gravity to dy
		dir = point_direction(xx, yy, xx + vx, yy + vy)
		spd = sqrt(sqr(vx) + sqr(vy))
		spd = spd * damp
		vx = lengthdir_x(spd,dir);
		vy = lengthdir_y(spd,dir);
		

		if (instance_position(xx, yy, oWall)) {
			empty = false;
			//For some reason, the image speed has to be set to a really low value
			image_speed = 0.15; //Animates the reticle
			draw_sprite(sReticle, image_index, xx, yy) //somehow animate 
			
		}
		else {
			draw_vertex_color(xx,yy,c_lime,1)
		}
    }
    draw_primitive_end();
    

