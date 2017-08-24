//Drawing Area Circles
draw_set_circle_precision(5000);

draw_set_color(c_blue);
for(var i = 0 ; i<10 ; i++) 
{
	draw_circle(x_center,y_center,area_radius + i,true);
}

draw_set_color(c_white);
for(var i = 0 ; i<5 ; i++) 
{
	draw_circle(x_center,y_center,next_area_radius + i,true);
}