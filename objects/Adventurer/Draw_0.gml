draw_set_alpha(1);
draw_self();
draw_healthbar(x-50, y+100, x+50, y+125, (currentHealth/maxHealth) * 100, c_blue, c_red, c_lime, 0, true, true)