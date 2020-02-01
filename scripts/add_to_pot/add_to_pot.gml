//@arg0 ingredient

var ing = argument0

//add ingredients to the pot's item_grid
for (var i = 0; i < ds_grid_height(item_grid); i++) {
	if (ds_grid_get(item_grid, 0, i) == noone) {
		ds_grid_set(item_grid, 0, i, ing.name);	
		ds_grid_set(item_grid, 1, i, ing.hp);
		ds_grid_set(item_grid, 2, i, ing.attack);
		ds_grid_set(item_grid, 3, i, ing.defense);
		ds_grid_set(item_grid, 4, i, ing.spd);
		ds_grid_set(item_grid, 5, i, ing.unprepared_sprite);
		
		//starts pot flash effect
		shaderBuff = 1

		//plays splashing sounds
		switch (i) {
			case 0:
				audio_sound_pitch(snd_pot_drop_1, 1)
				scr_pitchshift_sound(snd_pot_drop_1, 6, false)
			break;
		
			case 1:
				audio_sound_pitch(snd_pot_drop_2, 1.1)
				scr_pitchshift_sound(snd_pot_drop_2, 6, false)
			break;
		
			case 2:
				audio_sound_pitch(snd_pot_drop_3, 1.2)
				scr_pitchshift_sound(snd_pot_drop_3, 6, false)
			break;
		}
		
		break;
	}
}	
instance_destroy(ing);

