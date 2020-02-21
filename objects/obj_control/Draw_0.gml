/// @description Draw items

//Draw surface
draw_surface(global.surf_surface, 0, 0);

//Draw text
draw_text(40, 48, string_hash_to_newline("Press SPACE to reset room"));
draw_text(40, 48 + 32, string_hash_to_newline("Mouse left click to generate path"));
draw_text(40, 48 + 64, string_hash_to_newline("Mouse right click to place obstacle"));
draw_text(40, 48 + 96, string_hash_to_newline("WASD to move character"));

