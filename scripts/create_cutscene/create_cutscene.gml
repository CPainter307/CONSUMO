///@description create_cutscene
///@arg scene_info
///@arg t_skip_info

var inst = instance_create_depth(0, 0, 0, oCutscene)

with (inst) {
	scene_info = argument0;
	skip_info = argument1;
	event_perform(ev_other, ev_user0);
}