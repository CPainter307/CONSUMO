var iitem = argument2

var tt_pos_x = argument0+192
var tt_pos_y = argument1
var tt_buffer = 25
var tt_title = iitem[2]
var tt_type = "Ingredient"
if iitem[0] == oRecipe {
	tt_type = "Recipe"	
}

//remove space at the end
if string_char_at(tt_title, string_length(tt_title)) == " " {
	tt_title = string_copy(tt_title, 1, string_length(tt_title)-1)
}

//find width of box
draw_set_font(fGUITextThick)
draw_set_halign(fa_center)

var title_width = string_width(tt_title)
var tt_title_height = string_height(tt_title)

draw_set_font(fBattleTextThin)

var tt_max_width = max(title_width, string_width(tt_type))
var tt_type_height = string_height(tt_type)+tt_buffer

tt_max_width+=tt_buffer

draw_set_font(fGUITextThick)

//find icons
var icon_list = ds_list_create()
var icon_values = ds_list_create()
for (var i = 3; i < array_length_1d(iitem); i++) {
	if iitem[i] > 0 { // add to icon array if hads value is non-zero
		if i == 3 {
			ds_list_add(icon_list, sHeartIconOutlined)
			ds_list_add(icon_values, "+" + string(iitem[i]))
		}
		if i == 4 {
			ds_list_add(icon_list, sSwordIconOutlined)
			ds_list_add(icon_values, "+" + string(iitem[i]))
		}
		if i == 5 {
			ds_list_add(icon_list, sShieldIconOutlined)
			ds_list_add(icon_values, "+" + string(iitem[i]))
		}
		if i == 6 {
			ds_list_add(icon_list, sShoeIconOutlined)
			ds_list_add(icon_values, "+" + string(iitem[i]))
		}
	}
}

var tt_max_height = tt_title_height+tt_type_height
if ds_list_size(icon_list) > 0 { // drawing < 3 icons
	tt_max_height+=sprite_get_height(sHeartIconOutlined)
}
if ds_list_size(icon_list) > 2 { // drawing > 3 icons
	tt_max_height+=sprite_get_height(sHeartIconOutlined)+tt_buffer
}
				
//draw box
nine_slice_box(s9slice, tt_pos_x, tt_pos_y, tt_max_width, tt_max_height, true)
				
// draw name
draw_text_color(tt_pos_x+(tt_max_width/2), tt_pos_y, tt_title, BROWN_COL,BROWN_COL,BROWN_COL,BROWN_COL,1)
				
draw_set_font(fBattleTextThin)
				
//draw type
draw_text_color(tt_pos_x+(tt_max_width/2), tt_pos_y+tt_title_height, tt_type, BROWN_COL,BROWN_COL,BROWN_COL,BROWN_COL,1)
				
//draw icons
var y_pos_1 = tt_pos_y+tt_title_height+tt_type_height
var y_pos_2 = tt_pos_y+tt_title_height+tt_type_height+sprite_get_height(sHeartIconOutlined)+tt_buffer
				
//super hardcoded and bad
if ds_list_size(icon_list) == 1 { // drawing only one icon
	draw_sprite(icon_list[| 0], 0, tt_pos_x+(tt_max_width/2), y_pos_1) // draw right in the middle
	draw_text_outlined(tt_pos_x+(tt_max_width/2)+(sprite_get_width(sHeartIconOutlined)/4), y_pos_1+(sprite_get_height(sHeartIconOutlined)/6), BROWN_COL, OFFWHITE_COL, icon_values[| 0])
} else if ds_list_size(icon_list) == 2 { // drawing 2 icons
	draw_sprite(icon_list[| 0], 0, tt_pos_x+(tt_max_width/4), y_pos_1) // draw two next to each other
	draw_sprite(icon_list[| 1], 0, tt_pos_x-(tt_max_width/4)+tt_max_width, y_pos_1)
	draw_text_outlined(tt_pos_x+(tt_max_width/4)+(sprite_get_width(sHeartIconOutlined)/4), y_pos_1+(sprite_get_height(sHeartIconOutlined)/6), BROWN_COL, OFFWHITE_COL, icon_values[| 0])
	draw_text_outlined(tt_pos_x-(tt_max_width/4)+tt_max_width+(sprite_get_width(sHeartIconOutlined)/4), y_pos_1+(sprite_get_height(sHeartIconOutlined)/6), BROWN_COL, OFFWHITE_COL, icon_values[| 1])
} else if ds_list_size(icon_list) == 3 { // drawing 3 icons
	draw_sprite(icon_list[| 0], 0, tt_pos_x+(tt_max_width/4), y_pos_1) // draw a triangle
	draw_sprite(icon_list[| 1], 0, tt_pos_x-(tt_max_width/4)+tt_max_width, y_pos_1)
	draw_sprite(icon_list[| 2], 0, tt_pos_x+(tt_max_width/2), y_pos_2)
	draw_text_outlined(tt_pos_x+(tt_max_width/4)+(sprite_get_width(sHeartIconOutlined)/4), y_pos_1+(sprite_get_height(sHeartIconOutlined)/6), BROWN_COL, OFFWHITE_COL, icon_values[| 0])
	draw_text_outlined(tt_pos_x-(tt_max_width/4)+tt_max_width+(sprite_get_width(sHeartIconOutlined)/4), y_pos_1+(sprite_get_height(sHeartIconOutlined)/6), BROWN_COL, OFFWHITE_COL, icon_values[| 1])
	draw_text_outlined(tt_pos_x+(tt_max_width/2)+(sprite_get_width(sHeartIconOutlined)/4), y_pos_2+(sprite_get_height(sHeartIconOutlined)/6), BROWN_COL, OFFWHITE_COL, icon_values[| 2])
} else if ds_list_size(icon_list) == 4 { // drawing 4 icons (this doesnt happen yet)
	draw_sprite(icon_list[| 0], 0, tt_pos_x, tt_pos_y+tt_title_height+tt_type_height+tt_buffer) // draw a grid
	draw_sprite(icon_list[| 1], 0, tt_pos_x, tt_pos_y+tt_title_height+tt_type_height+tt_buffer)
	draw_sprite(icon_list[| 2], 0, tt_pos_x, tt_pos_y+tt_title_height+tt_type_height+tt_buffer)
	draw_sprite(icon_list[| 3], 0, tt_pos_x, tt_pos_y+tt_title_height+tt_type_height+tt_buffer)
}
				
ds_list_destroy(icon_list)
ds_list_destroy(icon_values)