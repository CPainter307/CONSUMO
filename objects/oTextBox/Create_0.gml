text = "none";

RED_TEXT = make_color_rgb(234, 50, 60) 
BLUE_TEXT = make_color_rgb(0, 152, 220)
GREEN_TEXT = make_color_rgb(90, 197, 79)

xBuffer = 30;
yBuffer = 20;

boxWidth = sprite_get_width(sTextbox) - (xBuffer);
stringHeight = string_height(text)+5;
page = 0;
creator = noone;
charCount = 0;
name = "";

enum voice {
	oldman,
	lizard,
	frog_egg, 
	hacky
}
portrait = sLizardPortrait;
//voice_snd = voice.oldman;

textboxPosX = (camera_get_view_width(view_camera[0])/2) - sprite_get_width(sTextbox)/2
textboxPosY = (camera_get_view_height(view_camera[0])) - 250

alpha_val = 0

modifier = 0
message_current = 0
timer = 0
cutoff = 0
t = 0
increment = 1

done = false