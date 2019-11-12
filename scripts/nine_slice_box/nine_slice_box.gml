/// @function nine_slice(sprite, x, y, width, height, stretched)
/// @arg sprite
/// @arg x
/// @arg y
/// @arg width
/// @arg height
/// @arg stretched
// Initialize variables

var _sprite, _x, _y, _x_pos, _y_pos, _center, _width, _height, _stretched, _sprite_width, _sprite_height, _tile_width, _tile_height;

// Define arguments
_sprite = argument0;	// Choose the panel sprite
_x = argument1;			// x coordinate
_y = argument2;			// y coordinate
_width = argument3;		// Width of the panel
_height = argument4;	// Height of the panel
_stretched = argument5;	// Stretch the panel (true) or tile (false)

// Calculate sprite width and height
_sprite_width = sprite_get_width(_sprite);
_sprite_height = sprite_get_height(_sprite);


//DRAW PANEL CORNERS

// Top Left
draw_sprite(_sprite, 0, _x, _y);	

// Top Right
draw_sprite(_sprite, 2, _x + _width - _sprite_width, _y);

// Bottom Left
draw_sprite(_sprite, 6, _x, _y + _height - _sprite_height);

// Bottom Right
draw_sprite(_sprite, 8, _x + _width - _sprite_width, _y + _height - _sprite_height);


//DRAW PANEL SIDES & CENTER

if (_stretched)
{
	//Top center
	draw_sprite_stretched(_sprite, 1, _x + _sprite_width, _y, _width - _sprite_width * 2, _sprite_height);
	
	// Middle Left
	draw_sprite_stretched(_sprite, 3, _x, _y + _sprite_height, _sprite_width, _height - _sprite_height*2);
	
	// Middle Center
	draw_sprite_stretched(_sprite, 4, _x + _sprite_width, _y + _sprite_height, _width - _sprite_width*2, _height - _sprite_height*2);
	
	// Middle Right
	draw_sprite_stretched(_sprite, 5, _x + _width - _sprite_width, _y + _sprite_height, _sprite_width, _height - _sprite_height*2);
	
	//Bottom center
	draw_sprite_stretched(_sprite, 7, _x + _sprite_width, _y + _height - _sprite_height, _width - _sprite_width*2, _sprite_height);
}
else
{
	// If not stretched, calculate number of sprite repetitions
	_width += _width mod _sprite_width;
	_height += _height mod _sprite_height;
 
	_tile_width = ((_width - _sprite_width * 2) / _sprite_width);
	_tile_height = ((_height - _sprite_height * 2) / _sprite_height);
	
	for (_x_pos = 1; _x_pos <= _tile_width; _x_pos++)
	{
		//Top Center
		draw_sprite(_sprite, 1, _x + (_x_pos * _sprite_width), _y);
		
		//Middle Center
		for (_y_pos = 1; _y_pos <= _tile_height; _y_pos++)
			draw_sprite(_sprite, 4, _x + (_x_pos * _sprite_width), _y + (_y_pos * _sprite_height)); 
			
		//Bottom Center
		draw_sprite(_sprite, 7, _x + (_x_pos * _sprite_width), _y + _height - _sprite_height);
	}
		
	for (_y_pos = 1; _y_pos <= _tile_height; _y_pos++)
	{
		// Middle Left
		draw_sprite(_sprite, 3, _x, _y + (_y_pos * _sprite_height));
		
		// Middle Right
		draw_sprite(_sprite, 5, _x + _width - _sprite_width, _y + (_y_pos * _sprite_height));
	}
}
///// @desc nine_slice_box(sprite, x1, y1, x2, y2)
///// @arg sprite
///// @arg x1
///// @arg y1
///// @arg x2
///// @arg y2

//var size = sprite_get_width(argument0) / 3;
//var x1 = argument1;
//var y1 = argument2;
//var x2 = argument3;
//var y2 = argument4;
//var w = x2 - x1;
//var h = y2 - y1;
//var columns = w div size;
//var rows = h div size;

////CORNERS
////top left
//draw_sprite_part(argument0, 0, 0, 0, size, size, x1, y1);
////top right
//draw_sprite_part(argument0, 0, size*2, 0, size, size, x1+(columns*size), y1);
////bottom left
//draw_sprite_part(argument0, 0, 0, size*2, size, size, x1, y1+(rows*size));
////bottom right
//draw_sprite_part(argument0, 0, size*2, size*2, size, size, x1+(columns*size), y1+(rows*size));

////EDGES
//for (var i = 1; i < rows; i++) {
//	//left edge
//	draw_sprite_part(argument0, 0, 0, size, size, size, x1, y1+(i*size));
//	//right edge
//	draw_sprite_part(argument0, 0, size*2, size, size, size, x1+(columns*size), y1+(i*size));
//}
//for (var i = 1; i < columns; i++) {
//	//top edge
//	draw_sprite_part(argument0, 0, size, 0, size, size, x1+(i*size), y1);
//	//bottom edge
//	draw_sprite_part(argument0, 0, size, size*2, size, size, x1+(i*size), y1+(rows*size));
//}

////MIDDLE
//for (var i = 1; i < columns; i++) {
//	for (var j = 1; j < rows; j++) {
//		draw_sprite_part(argument0, 0, size, size, size, size, x1+(i*size), y1+(j*size));
//	}
//}