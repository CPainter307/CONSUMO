/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


if (flash > 0)
{
	flash--;
	shader_set(shHit);
	draw_self();
	shader_reset();
}