var iitem = argument2

draw_set_font(fGUITextThick)
var tt_pos_x = argument0+192
var tt_pos_y = argument1
var tt_buffer = 10
var tt_title = iitem[2]
var tt_type = "Ingredient"
if iitem[0] == oRecipe {
	tt_type = "Recipe"	
}

//remove space at the end
if string_char_at(tt_title, string_length(tt_title)) == " " {
	tt_title = string_copy(tt_title, 1, string_length(tt_title)-1)
}
draw_set_halign(fa_center);

var tt_max_width = string_width(tt_title)
var tt_max_height = 200
				
var icon_list = ds_list_create()
for (var i = 3; i < array_length_1d(iitem); i++) {
	if iitem[i] > 0 { // add to icon array if hads value is non-zero
		if i == 3 {
			ds_list_add(icon_list, sHeartIconOutlined)
		}
		if i == 4 {
			ds_list_add(icon_list, sSwordIconOutlined)
		}
		if i == 5 {
			ds_list_add(icon_list, sShieldIconOutlined)
		}
		if i == 6 {
			ds_list_add(icon_list, sShoeIconOutlined)
		}
	}
}
				
//draw box
if ds_list_size(icon_list) > 2 { // draw the box longer if there are more icons
	nine_slice_box(s9slice, tt_pos_x-tt_buffer, tt_pos_y, tt_pos_x+tt_max_width+tt_buffer, tt_pos_y+tt_max_height)
} else {
	nine_slice_box(s9slice, tt_pos_x-tt_buffer, tt_pos_y, tt_pos_x+tt_max_width+tt_buffer, tt_pos_y+tt_max_height-sprite_get_height(sHeartIconOutlined))	
}
				
// draw name
draw_text_color(tt_pos_x+(tt_max_width/2), tt_pos_y, tt_title, BROWN_COL,BROWN_COL,BROWN_COL,BROWN_COL,1)

var tt_title_height = string_height(tt_title)
				
draw_set_font(fBattleTextThin)
draw_set_halign(fa_center);
				
//draw type
draw_text_color(tt_pos_x+(tt_max_width/2), tt_pos_y+tt_title_height, tt_type, BROWN_COL,BROWN_COL,BROWN_COL,BROWN_COL,1)
				
var tt_type_height = string_height(tt_type)
				
//draw icons
var y_pos_1 = tt_pos_y+tt_title_height+tt_type_height+(tt_buffer*3)
var y_pos_2 = tt_pos_y+tt_title_height+tt_type_height+(tt_buffer*3)+sprite_get_height(sHeartIconOutlined)
				
if ds_list_size(icon_list) == 1 { // drawing only one icon
	draw_sprite(icon_list[| 0], 0, tt_pos_x+(tt_max_width/2), y_pos_1) // draw right in the middle
} else if ds_list_size(icon_list) == 2 { // drawing 2 icons
	draw_sprite(icon_list[| 0], 0, tt_pos_x+(tt_max_width/4), y_pos_1) // draw two next to each other
	draw_sprite(icon_list[| 1], 0, tt_pos_x-(tt_max_width/4)+tt_max_width, y_pos_1)
} else if ds_list_size(icon_list) == 3 { // drawing 3 icons
	draw_sprite(icon_list[| 0], 0, tt_pos_x+(tt_max_width/4), y_pos_1) // draw a triangle
	draw_sprite(icon_list[| 1], 0, tt_pos_x-(tt_max_width/4)+tt_max_width, y_pos_1)
	draw_sprite(icon_list[| 2], 0, tt_pos_x+(tt_max_width/2), y_pos_2)
} else if ds_list_size(icon_list) == 4 { // drawing 4 icons
	draw_sprite(icon_list[| 0], 0, tt_pos_x, tt_pos_y+tt_title_height+tt_type_height+tt_buffer) // draw a grid
	draw_sprite(icon_list[| 1], 0, tt_pos_x, tt_pos_y+tt_title_height+tt_type_height+tt_buffer)
	draw_sprite(icon_list[| 2], 0, tt_pos_x, tt_pos_y+tt_title_height+tt_type_height+tt_buffer)
	draw_sprite(icon_list[| 3], 0, tt_pos_x, tt_pos_y+tt_title_height+tt_type_height+tt_buffer)
}
				
ds_list_destroy(icon_list)