///scr_health_circle(x,y,radius,maxsegments,segments,startangle,totalangle,direction,colour)

///@arg0 x
///@arg1 y
///@arg2 radius
///@arg3 maxsegments
///@arg4 segments
///@arg5 startangle
///@arg6 totalangle
///@arg7 direction
///@arg8 colour

anglechange = (argument6/argument3)*(pi/180)
i = argument5*(pi/180)

ax = argument0+(cos(i)*argument2)
ay = argument1-(sin(i)*argument2)

repeat(argument4) {
i += argument7 * anglechange

bx = argument0+(cos(i)*argument2)
by = argument1-(sin(i)*argument2)

draw_triangle_colour(ax,ay,bx,by,argument0,argument1,argument8,argument8,argument8,0)

ax = bx
ay = by
}