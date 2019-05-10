text = "none";

xBuffer = 30;
yBuffer = 20;

boxWidth = sprite_get_width(sTextbox) - (2*xBuffer);
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

textboxPosX = (camera_get_view_width(view_camera[0])/2) - 255
textboxPosY = (camera_get_view_height(view_camera[0])) - 220