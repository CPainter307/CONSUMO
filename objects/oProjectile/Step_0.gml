//event_inherited()

hitbox.x = x
hitbox.y = y

x += dirx * spd
y += diry * spd

if place_meeting(x, y, oCollidable) {
	instance_destroy()	
}