/// @description define variables for ingredients
event_inherited();
prepared = false;
enum_type = pointer_null;
name = "Bosco Berry";
type = "fruit";
runeSprite = sBlankRune;
classification = ""; //four types of classi right now: meat, vegetable, seasoning, spice
chops = 0;

adjective = "Sweet"
half_name = "Berry"

hp = 20;
attack = 0;
defense = 0;
spd = 0;
elmatk = 0;
elmdef = 0;
special = false;
effect = "";
modifier1 = [1, 1, 1, 1, 1, 1];
modifier2 = [1, 1, 1, 1, 1, 1];

beingCooked = false;

//sprite indexes
unprepared_sprite = sBoscoBerry;
prepared_sprite = sBoscoBerry;

//prepared timer
prepared_check = 600;
prepared_i = 0;

//sound variables
in_target = false;