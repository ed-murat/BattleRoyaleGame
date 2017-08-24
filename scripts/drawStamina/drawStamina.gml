stamina = argument0;
stamina_max = argument1;
can_run = argument2;

//Draw Stamina
	//Draw Indicator bar
draw_set_color(c_black);
draw_rectangle(395,window_get_height()-20,window_get_width()-395,window_get_height()-5,0);
if(!can_run)
{
	draw_set_color(c_gray);
	draw_rectangle(400,window_get_height()-15,window_get_width()-400,window_get_height()-10,0);
}
draw_set_color(c_green);
draw_rectangle(400,window_get_height()-15,stamina*((window_get_width()-800)/stamina_max)+400,window_get_height()-10,0);
	//Draw Stamina value
draw_set_color(c_white);
draw_set_font(fnt_cocogoose8);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text(window_get_width()/2,window_get_height()-12,string(stamina)+"/"+string(stamina_max));
