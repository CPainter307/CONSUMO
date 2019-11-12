event_inherited()

projectile_timer--
if projectile_timer <= 0 {
	var inst = instance_create_layer(x, y-100, "Objects", oProjectile)
	inst.dirx = sign(x-oPlayer.x)*-1
	projectile_timer = SHOOT_TIME
}

