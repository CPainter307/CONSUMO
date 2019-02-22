/// @funcion ds_3d_set
/// @argument0 name
/// @argument1 width
/// @argument2 height
/// @argument3 length
/// @argument4 value

var array = argument0;
var width = argument1;
var height = argument2;
var length = argument3;
var value = argument4;

var grid = array[length];
grid[# width, height] = value;