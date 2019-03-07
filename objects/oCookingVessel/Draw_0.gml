if (drawText and textDisappearTimer < 60 and instance_exists(inst)) {
    draw_set_color(c_white)
    draw_set_halign(fa_center);
    draw_set_font(fRecipeText);
    draw_text(oPlayer.x, oPlayer.y - 150,
        "Health: " + string(inst.hp) +
        " Attack: " + string(inst.attack) +
        " Defense: " + string(inst.defense) +
        " Speed: " + string(inst.spd) + 
        " Name: " + string(inst.name)
    );
    textDisappearTimer++;
	
} else if (textDisappearTimer >= 60) {
    drawText = false;
    textDisappearTimer = 0;
}