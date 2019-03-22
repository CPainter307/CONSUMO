draw_set_alpha(1);
draw_self();
draw_healthbar(x-maxHealth/3, y-225, x+maxHealth/3, y-200, (currentHealth/maxHealth) * 100, c_blue, c_red, c_lime, 0, true, true)
draw_set_color(c_white);
draw_set_font(DefaultFont);
draw_text(x,y-220, currentHealth);