/// @desc Size variables and mode setup

w = display_get_width();
h = display_get_height();
h_half = h * 0.5;
enum TRANS_MODE
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO,
	ROOM_RESTART
}
mode = TRANS_MODE.INTRO;
percent = 1;
target = room;