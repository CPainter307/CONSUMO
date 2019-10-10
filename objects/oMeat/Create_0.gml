event_inherited();
prepared = false;
name = "Meat ";
type = "booster";
ing_id = 1;
hp = 20;
attack = 0;
defense = 0;
spd = 0;
special = false;
runeSprite = sMeatRune;
classification = "meat";
adjective = "Meaty ";
chops = 0;

preppedVersion = oPreparedMeat;
pickUpSound = snd_pickup_meat;

var fix;
fix = physics_fixture_create()
physics_fixture_set_box_shape(fix, sprite_width/2, 14)
physics_fixture_set_density(fix, 0.5);
physics_fixture_bind(fix, self)
physics_fixture_delete(fix)
phy_active = true 