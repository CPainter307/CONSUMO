/// @description Insert description here
// You can write your code in this editor
instance_destroy();
instance_create_layer(x,y + sin(get_timer()/200000)*5, "Objects", oTestProp);
oTestProp.image_xscale = 0.25;
oTestProp.image_yscale = 0.25;
oTestProp.isPickingUp = false;