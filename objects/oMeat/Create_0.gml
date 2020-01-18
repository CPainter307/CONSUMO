event_inherited();
prepared = true;
enum_type = ingr.oMeat;
name = "Meat ";
type = "booster";
hp = 20;
attack = 0;
defense = 0;
spd = 0;
special = false;
runeSprite = sMeatRune;
classification = "meat";
adjective = "Meaty ";
pickUpSound = snd_pickup_meat;

var fix;
fix = physics_fixture_create()
physics_fixture_set_box_shape(fix, sprite_width/4, sprite_height/4)
physics_fixture_set_density(fix, 0.5);
physics_fixture_bind(fix, self)
physics_fixture_delete(fix)
phy_active = true

//sprites
unprepared_sprite = sMeat;
prepared_sprite = sPreparedMeat;