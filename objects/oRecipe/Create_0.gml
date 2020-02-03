event_inherited();
//name = "";
mealName = ""; //soup, kabob, etc...
hp = 0;
attack = 0;
defense = 0;
spd = 0;
pickUpSound = snd_pot_drop_1;
ing = [noone, noone, noone];

//0 = raw, 1 = undercooked, 2 = perfect, 3 = burnt
quality = 0;

var fix;
fix = physics_fixture_create()
physics_fixture_set_box_shape(fix, sprite_width/4, sprite_height/4)
physics_fixture_set_density(fix, 0.5);
physics_fixture_bind(fix, self)
physics_fixture_delete(fix)
phy_active = true
bowl_sprite = sBowl;
broth_sprite = sBroth;
topping_sprite = sTopping;