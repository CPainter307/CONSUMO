//mask_index = -1
event_inherited()
sprite_index = -1
active = true

var fix;
fix = physics_fixture_create()
physics_fixture_set_box_shape(fix, sprite_width*image_xscale/2, sprite_height*image_yscale/2)
physics_fixture_bind(fix, self)
physics_fixture_delete(fix)