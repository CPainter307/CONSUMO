/// @description draws runes on pot hopefully
event_inherited();

if (ds_list_size(item_list) == 1) {
	draw_sprite((ds_list_find_value(item_list, 0)).runeSprite, 1, x - 15, y + 35); //FIRST position

}

if (ds_list_size(item_list) == 2) {
	draw_sprite((ds_list_find_value(item_list, 0)).runeSprite, 1, x - 15, y + 35); //FIRST position
	draw_sprite((ds_list_find_value(item_list, 1)).runeSprite, 1, x, y + 37); //second position
}

if (ds_list_size(item_list) == 3) {
	draw_sprite((ds_list_find_value(item_list, 0)).runeSprite, 1, x - 15, y + 35); //FIRST position
	draw_sprite((ds_list_find_value(item_list, 1)).runeSprite, 1, x, y + 37); //second position
	draw_sprite((ds_list_find_value(item_list, 2)).runeSprite, 1, x + 15, y + 35); //THIRD position
}
