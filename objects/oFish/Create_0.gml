event_inherited();
prepared = false;
enum_type = ingr.oFish;
name = "Fish ";
type = "booster";
hp = 0;
attack = 5;
defense = 0;
spd = 0;
special = false;
runeSprite = sFishRune
classification = "meat";
adjective = "Fishy ";
pickUpSound = snd_pickup_meat;

//sprites
unprepared_sprite = sFish;
prepared_sprite = sPreparedFish;

var fix;
fix = physics_fixture_create()
physics_fixture_set_box_shape(fix, sprite_width/4, sprite_height/4)
physics_fixture_set_density(fix, 0.5);
physics_fixture_bind(fix, self)
physics_fixture_delete(fix)
phy_active = true