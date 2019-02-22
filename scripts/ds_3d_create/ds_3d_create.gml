/// @funcion ds_grid_3d_create
/// @argument0 name
/// @argument1 width
/// @argument2 height
/// @argument3 length

var array = argument0;
var width = argument1;
var height = argument2;
var length = argument3;

for (var i = 0; i < length; i++) {
	array[@ i] = ds_grid_create(width, height);	
}