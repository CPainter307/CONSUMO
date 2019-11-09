/// @description define variables for ingredients
event_inherited();
prepared = false;
enum_type = ingr.oMushroom;
name = "Mushroom";
type = "booster";
runeSprite = sMushroomRune;
classification = "vegetable"; //four types of classi right now: meat, vegetable, seasoning, spice
adjective = "Shroomy ";
chops = 0;

hp = 0;
attack = 0;
defense = 0;
spd = 0;
elmatk = 0;
elmdef = 5;
special = false;
effect = "";
modifier1 = [1, 1, 1, 1, 1, 1];
modifier2 = [1, 1, 1, 1, 1, 1];
pickUpSound = snd_pickup_herb;

beingCooked = false;

//sprites
unprepared_sprite = sMushroom;
prepared_sprite = sPreparedMushroom;