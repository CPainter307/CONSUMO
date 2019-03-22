/// @desc nine_slice_box(sprite, x1, y1, x2, y2)
/// @arg sprite
/// @arg x1
/// @arg y1
/// @arg x2
/// @arg y2

var size = sprite_get_width(argument0) / 3;
var x1 = argument1;
var y1 = argument2;
var x2 = argument3;
var y2 = argument4;
var w = x2 - x1;
var h = y2 - y1;
var columns = w div size;
var rows = h div size;

//CORNERS
//top left
draw_sprite_part(argument0, 0, 0, 0, size, size, x1, y1);
//top right
draw_sprite_part(argument0, 0, size*2, 0, size, size, x1+(columns*size), y1);
//bottom left
draw_sprite_part(argument0, 0, 0, size*2, size, size, x1, y1+(rows*size));
//bottom right
draw_sprite_part(argument0, 0, size*2, size*2, size, size, x1+(columns*size), y1+(rows*size));

//EDGES
for (var i = 1; i < rows; i++) {
	//left edge
	draw_sprite_part(argument0, 0, 0, size, size, size, x1, y1+(i*size));
	//right edge
	draw_sprite_part(argument0, 0, size*2, size, size, size, x1+(columns*size), y1+(i*size));
}
for (var i = 1; i < columns; i++) {
	//top edge
	draw_sprite_part(argument0, 0, size, 0, size, size, x1+(i*size), y1);
	//bottom edge
	draw_sprite_part(argument0, 0, size, size*2, size, size, x1+(i*size), y1+(rows*size));
}

//MIDDLE
for (var i = 1; i < columns; i++) {
	for (var j = 1; j < rows; j++) {
		draw_sprite_part(argument0, 0, size, size, size, size, x1+(i*size), y1+(j*size));
	}
}