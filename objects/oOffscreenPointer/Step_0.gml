if !instance_exists(point_to) {
	exit
}

var src = oPlayer
var pad = 50
var sx, sy, tx, ty, dx, dy, vx, vy, vl;
sx = src.x; sy = src.y // source position
tx = point_to.x; ty = point_to.y // destination position
dx = tx - sx; dy = ty - sy // difference
vl = sqrt(dx * dx + dy * dy) // distance
if (vl != 0) {
    vx = dx / vl; vy = dy / vl
} else {
    vx = 0; vy = 0;
}
//if (vl > inner * 2) {
//    vl -= inner
//    image_alpha = 1
//} else {
//    image_alpha = max(0, (vl - inner) / inner)
//    vl /= 2
//}
if point_in_rectangle(point_to.x, point_to.y, camera_get_view_x(view), camera_get_view_y(view), oDisplayManager.camera_width+camera_get_view_x(view), oDisplayManager.camera_height+camera_get_view_y(view)) {
	alpha = lerp(alpha, 0, 0.2)
} else {
	alpha = lerp(alpha, 1, 0.2)
}
angle = point_direction(sx, sy, tx, ty)
if (vy < 0) {
    vl = min(vl, ((camera_get_view_y(view) + pad) - sy) / vy)
} else if (vy > 0) {
    vl = min(vl, ((camera_get_view_y(view) + oDisplayManager.camera_height - pad) - sy) / vy)
}
if (vx < 0) {
    vl = min(vl, ((camera_get_view_x(view) + pad) - sx) / vx)
} else if (vx > 0) {
    vl = min(vl, ((camera_get_view_x(view) + oDisplayManager.camera_width - pad) - sx) / vx)
}
x = sx + vx * vl
y = sy + vy * vl