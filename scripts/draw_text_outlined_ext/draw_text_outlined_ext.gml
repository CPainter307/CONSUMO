///draw_text_outlined(x, y, outline color, string color, string)  
///@arg x
///@arg y
///@arg outlineColor
///@arg stringColor
///@arg string
///@arg alpha
///@arg size
var xx,yy;  
xx = argument[0];  
yy = argument[1];  
  
var a = draw_get_alpha()
//Outline  
draw_set_color(argument[2]);  
draw_text(xx+argument[6], yy+argument[6], argument[4]);  
draw_text(xx-argument[6], yy-argument[6], argument[4]);  
draw_text(xx,   yy+argument[6], argument[4]);  
draw_text(xx+argument[6],   yy, argument[4]);  
draw_text(xx,   yy-argument[6], argument[4]);  
draw_text(xx-argument[6],   yy, argument[4]);  
draw_text(xx-argument[6], yy+argument[6], argument[4]);  
draw_text(xx+argument[6], yy-argument[6], argument[4]);  
  
//Text  
draw_set_alpha(argument[5])
draw_set_color(argument[3]);  
draw_text(xx, yy, argument[4]);
draw_set_alpha(a)