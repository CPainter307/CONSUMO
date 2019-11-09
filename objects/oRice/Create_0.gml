/// @description define variables for ingredients
event_inherited();
prepared = false;
enum_type = ingr.oRice;
name = "Rice";
type = "booster";
runeSprite = sRiceRune;
classification = "grain"; //four types of classi right now: meat, vegetable, seasoning, spice
adjective = "Grainy ";
chops = 0;

hp = 0;
attack = 0;
defense = 0;
spd = 0;
elmatk = 5;
elmdef = 0;
special = false;
effect = "";
modifier1 = [1, 1, 1, 1, 1, 1];
modifier2 = [1, 1, 1, 1, 1, 1];
pickUpSound = snd_pickup_herb;
beingCooked = false;

//sprites
unprepared_sprite = sRice;
prepared_sprite = sPreparedRice;