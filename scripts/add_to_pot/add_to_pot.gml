//@arg0 ingredient

var ing = argument0

ds_list_add(item_list, ing);	
ing.beingCooked = true;
		
//starts pot flash effect
shaderBuff = 1
		
//play potdrop sound
switch (ds_list_size(item_list)) {
	case 1:
		audio_sound_pitch(snd_pot_drop_1, 1)
		scr_pitchshift_sound(snd_pot_drop_1, 6, false)
	break;
		
	case 2:
		audio_sound_pitch(snd_pot_drop_2, 1.1)
		scr_pitchshift_sound(snd_pot_drop_2, 6, false)
	break;
		
	case 3:
		audio_sound_pitch(snd_pot_drop_3, 1.2)
		scr_pitchshift_sound(snd_pot_drop_3, 6, false)
	break;
}

with(ing) {
	if (beingCooked) {
		//moved to another place - REMEMBER TO EVENTUALLY DESTROY ONE DAY
		phy_position_x = oIngredientHolder.x;
		phy_position_y = oIngredientHolder.y;
	}
}