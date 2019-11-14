offset_y = 0
length = 5
host = self
damp = 20
freq = 1

next_rope = instance_create_layer(x, y + offset_y, "Objects", oRope)

pin = instance_create_layer(x, y, "Objects", oPin)

attach = physics_joint_distance_create(host,next_rope,host.x,host.y,next_rope.x,next_rope.y,false)
physics_joint_set_value(attach, phy_joint_damping_ratio, damp)
physics_joint_set_value(attach, phy_joint_frequency, freq)

with (next_rope) {
	parent = other.id	
}

repeat (length) {
	offset_y += 1
	last_rope = next_rope
	next_rope = instance_create_layer(x, y + offset_y, "Objects", oRope)
	
	link = physics_joint_distance_create(last_rope,next_rope,last_rope.x,last_rope.y,next_rope.x,next_rope.y,false)
	physics_joint_set_value(link, phy_joint_damping_ratio, damp)
	physics_joint_set_value(link, phy_joint_frequency, freq)
	
	with (next_rope) {
		parent = other.last_rope
	}
}

link = physics_joint_distance_create(next_rope,pin,next_rope.x,next_rope.y,pin.x,pin.y,false)
physics_joint_set_value(link, phy_joint_damping_ratio, damp)
physics_joint_set_value(link, phy_joint_frequency, freq)