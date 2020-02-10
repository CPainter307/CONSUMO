/// @description define variables for ingredients
event_inherited();
prepared = false;
enum_type = pointer_null;
name = "Fugi Nut";
type = "nut";
runeSprite = sBlankRune;
classification = ""; //four types of classi right now: meat, vegetable, seasoning, spice
chops = 0;

adjective = "Nutty"
half_name = "Fugi"

hp = 0;
attack = 0;
defense = 5;
spd = 0;
elmatk = 0;
elmdef = 0;
special = false;
effect = "";
modifier1 = [1, 1, 1, 1, 1, 1];
modifier2 = [1, 1, 1, 1, 1, 1];

beingCooked = false;

//sprite indexes
unprepared_sprite = sFugiNut;
prepared_sprite = sFugiNut;

//prepared timer
prepared_check = 600;
prepared_i = 0;

//sound variables
in_target = false;