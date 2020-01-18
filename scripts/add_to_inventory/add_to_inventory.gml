///@arg0 nearest_item
var nearest_item = argument0

oPlayer.image_index = 0
oPlayer.sprite_index = sPlayerPickup

var ni_array

ni_array = [nearest_item.object_index, nearest_item.sprite_index, nearest_item.name, nearest_item.hp, nearest_item.attack, nearest_item.defense, nearest_item.spd]
	
//add item to empty slot if it doesnt already exist
for (var i = 0; i < 3; i++) {
	if held_items[i] == noone {
		held_items[i] = ni_array;
		break;
	}
}
//destroy item if picked up
instance_destroy(nearest_item)	