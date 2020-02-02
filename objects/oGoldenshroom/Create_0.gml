/// @description define variables for ingredients
event_inherited();
prepared = false;
enum_type = pointer_null;
name = "Goldenshroom";
type = "fungus";
runeSprite = sBlankRune;
classification = ""; //four types of classi right now: meat, vegetable, seasoning, spice
adjective = "";
chops = 0;

hp = 0;
attack = 0;
defense = 0;
spd = 5;
elmatk = 0;
elmdef = 0;
special = false;
effect = "";
modifier1 = [1, 1, 1, 1, 1, 1];
modifier2 = [1, 1, 1, 1, 1, 1];

beingCooked = false;

//sprite indexes
unprepared_sprite = sGoldenshroom;
prepared_sprite = sGoldenshroom;

//prepared timer
prepared_check = 600;
prepared_i = 0;

//sound variables
in_target = false;