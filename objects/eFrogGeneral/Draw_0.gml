event_inherited();
/*draw_set_alpha(0.5);
draw_rectangle_colour(bbox_left,bbox_top,bbox_right,bbox_bottom,c_red,c_red,c_red,c_red,false);*/
draw_set_alpha(1)
draw_self()

if instance_exists(proj_hitbox)
	draw_sprite(sHitBox, 0, proj_hitbox.x, proj_hitbox.y)