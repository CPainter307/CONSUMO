//BuffParticle Particle System
ps = part_system_create();
part_system_depth(ps, -1);

//NewEffect Particle Types
////Effect1
//global.pt_Buff = part_type_create();
//part_type_shape(global.pt_Buff, pt_shape_pixel);
//part_type_sprite(global.pt_Buff, sSuckyStar, 1, 1, 0);
//part_type_size(global.pt_Buff, 1, 1.30, 0, 0);
//part_type_scale(global.pt_Buff, 1, 1);    
//part_type_orientation(global.pt_Buff, -358, 355, 2, 1, 0);
//part_type_color3(global.pt_Buff, 32768, 65280, 16777215);
//part_type_alpha3(global.pt_Buff, 1, 1, 1);
//part_type_blend(global.pt_Buff, 1);
//part_type_life(global.pt_Buff, 60, 65);
//part_type_speed(global.pt_Buff, 1, 2, 0, 1);
//part_type_direction(global.pt_Buff, 0, 360, 0, 0);
//part_type_gravity(global.pt_Buff, 0.20, 90);

////Effect2
//global.pt_Buff2 = part_type_create();
//part_type_shape(global.pt_Buff2, pt_shape_star);
//part_type_size(global.pt_Buff2, 0.10, 0.10, 0, 0.10);
//part_type_scale(global.pt_Buff2, 1, 1);
//part_type_orientation(global.pt_Buff2, -8, 326, 3, 4, 1);
//part_type_color3(global.pt_Buff2, 16777215, 16777215, 16777215);
//part_type_alpha3(global.pt_Buff2, 1, 0.56, 0.08);
//part_type_blend(global.pt_Buff2, 1);
//part_type_life(global.pt_Buff2, 10, 20);
//part_type_speed(global.pt_Buff2, 10, 10, 0, 0);
//part_type_direction(global.pt_Buff2, 0, 360, 0, 0);
//part_type_gravity(global.pt_Buff2, 1, 269);

////Linking Particle Types together (Death and Step)
//part_type_death(global.pt_Buff, 1, global.pt_Buff2);

////NewEffect Emitters
//global.pe_Buff = part_emitter_create(ps);

//NewEffect emitter positions. Streaming or Bursting Particles.
var xp, yp;
xp = x;
yp = y;
part_emitter_stream(ps, global.pe_Buff, global.pt_Buff, 1);
part_emitter_region(ps, global.pe_Buff, xp-68, xp+60, yp+249, yp+283, ps_shape_rectangle, ps_distr_gaussian);

//Destroying Emitters
//part_emitter_destroy(ps, global.pe_Buff);