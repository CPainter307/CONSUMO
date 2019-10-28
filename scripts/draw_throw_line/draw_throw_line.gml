xx = oPlayer.x
yy = oPlayer.y


//draw_self();
//figure the mouse dir and distance for aiming and force
dir = point_direction(xx, yy, mouse_x, mouse_y);
spd = 20;
//start at x,y of launcher, (my sprite has the origns in the middle of the Y part of the sling)
empty = true;
//what are the dx,dy for movement
vx = lengthdir_x(spd,dir);
vy = lengthdir_y(spd,dir);
//the gravity
grav = 0.27; 
//dragging, draw the lineif(mouse_check_button(mb_left))
count = 0;

    draw_primitive_begin(pr_linelist)
    draw_vertex_color(xx,yy,c_lime,1)
    //while(0<yy<500)
	while(empty)
    {
		count++
		if (count >= 100) {
			empty = false;	
		}
        xx+=vx; //add dx
        yy+=vy; //add dy
        vy+= grav; //add gravity to dy
		if (instance_position(xx, yy, oWall)) {
			empty = false;
			draw_sprite(sReticle, 0, xx, yy) //somehow animate this
			
		}
		else {
			draw_vertex_color(xx,yy,c_lime,1)
		}
    }
    draw_primitive_end();
    

