/// @funcion ds_3d_get
/// @argument0 name
/// @argument1 width
/// @argument2 height
/// @argument3 length

var array = argument0;
var width = argument1;
var height = argument2;
var length = argument3;

var grid = array[length];
return grid[# width, height];