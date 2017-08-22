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

//Draw Health
	//Draw Indicator bar
draw_set_color(c_black);
draw_rectangle(395,window_get_height()-45,window_get_width()-395,window_get_height()-25,0);
draw_set_color(c_maroon);
draw_rectangle(400,window_get_height()-40,health_point*((window_get_width()-800)/health_max)+400,window_get_height()-30,0);
	//Draw Health value
draw_set_color(c_white);
draw_set_font(fnt_cocogoose12);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text(window_get_width()/2,window_get_height()-33,string(health_point)+"/"+string(health_max));

//Draw Ranking
if(!show_map)
{
	draw_set_color(c_black);
	draw_set_font(fnt_cocogoose20);
	draw_set_halign(fa_right);
	draw_set_valign(fa_center);
	draw_text(window_get_width()-40,40,string(obj_game.player_alive)+"/"+string(obj_game.player_max));
}

//Draw Kills
if(!show_map)
{
	draw_set_color(c_black);
	draw_set_font(fnt_cocogoose20);
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	if(player_kill>1)
	{
		draw_text(20,40,string(player_kill)+" kills");
	}
	else
	{
		draw_text(20,40,string(player_kill)+" kill");
	}
}

//Draw Reduction timer
var timer = 0;
with(obj_game) {
		timer = alarm_get(0);
	}
if(!show_map)
{
	draw_set_color(c_black);
	draw_set_font(fnt_cocogoose20);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	if(timer%3600/60<10)
	{
		draw_text(window_get_width()/2,40,string(floor(timer%216000/3600))+":0"+string(floor(timer%3600/60)));
	}
	else
	{
		draw_text(window_get_width()/2,40,string(floor(timer%216000/3600))+":"+string(floor(timer%3600/60)));
	}
}

//Draw Inventory
draw_set_color(c_black);
draw_set_font(fnt_cocogoose12);
draw_set_halign(fa_right);
draw_set_valign(fa_center);
draw_text(window_get_width()-40,window_get_height()-20,string(obj_game.item_array[item_selected].item_name));
draw_text(window_get_width()-40,window_get_height()-50,string(ds_map_find_value(inventory_map,item_selected)));
draw_sprite(obj_game.item_array[item_selected].sprite_index,0,window_get_width()-80,window_get_height()-55);

draw_set_halign(fa_left);
draw_set_valign(fa_center);
draw_text(40,window_get_height()-20,string(obj_game.weapon_array[weapon_selected].weapon_name));
draw_sprite(obj_game.weapon_array[weapon_selected].sprite_index,0,80,window_get_height()-55);

//Draw Equipment
if (helmet_isEquiped == 1)
{
    draw_sprite(spr_helmet,0,160,window_get_height()-55);
}

if (kevlar_isEquiped == 1)
{
	draw_sprite(spr_kevlar,0,240,window_get_height()-55);
}

//Draw Map
if(show_map)
{
	draw_set_color(c_black);
	draw_set_alpha(0.4);
	draw_rectangle(0,0,room_width,room_height,0);
	draw_set_color(c_green);
	draw_set_alpha(1);
	draw_rectangle(440,20,440+window_get_width()-880,20+window_get_height()-40,0);	
	draw_set_color(c_red);
	draw_circle(440+x_map,20+y_map,5,0);
	draw_set_color(c_blue);
	draw_circle(440+(obj_game.x_center/room_width*1040),20+(obj_game.y_center/room_height*1040),obj_game.area_radius/room_width*1040,1);
	draw_set_color(c_white);
	draw_circle(440+(obj_game.x_center/room_width*1040),20+(obj_game.y_center/room_height*1040),(obj_game.area_radius*obj_game.area_reduction)/room_width*1040,1);

	draw_set_color(c_white);
	draw_set_font(fnt_cocogoose20);
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	draw_text(20,100,"Game time :");
	draw_text(20,140,"Next shrink :");
	
	draw_text(20,220,"Player alive :");
	draw_text(20,260,"Player at start :");
	
	draw_text(1500,100,"X :");
	draw_text(1500,140,"Y :");
	draw_text(1500,220,"Kill :");
	
	draw_set_halign(fa_right);
	if(obj_game.game_time%3600/60<10)
	{
		draw_text(420,100,string(floor(obj_game.game_time%216000/3600))+":0"+string(floor(obj_game.game_time%3600/60)));
	}
	else
	{
		draw_text(420,100,string(floor(obj_game.game_time%216000/3600))+":"+string(floor(obj_game.game_time%3600/60)));
	}
	if(timer%3600/60<10)
	{
		draw_text(420,140,string(floor(timer%216000/3600))+":0"+string(floor(timer%3600/60)));
	}
	else
	{
		draw_text(420,140,string(floor(timer%216000/3600))+":"+string(floor(timer%3600/60)));
	}
	draw_text(420,220,string(obj_game.player_alive));
	draw_text(420,260,string(obj_game.player_max));
	
	draw_text(1900,100,string(floor(x/100)));
	draw_text(1900,140,string(floor(y/100)));
	draw_text(1900,220,string(player_kill));
}

//Draw vignetting
	//Blood
if(blood_screen != 0)
{
	draw_sprite_ext(spr_bloodscreen,0,window_get_width()/2,window_get_height()/2,1,1,0,c_white,blood_screen);
	blood_screen -= 0.01;
	if(blood_screen<0) blood_screen=0;
}
	//Barrier
if(barrier_screen != 0)
{
	draw_sprite_ext(spr_barrierscreen,0,window_get_width()/2,window_get_height()/2,1,1,0,c_white,barrier_screen);
	barrier_screen -= 0.01;
	if(barrier_screen<0) barrier_screen=0;
}

//Draw death screen
if(is_dead)
{
	draw_set_color(c_black);
	draw_set_alpha(0.85);
	draw_rectangle(0,0,window_get_width(),window_get_height(),0)
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_font(fnt_cocogoose70);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text(window_get_width()/2,window_get_height()/2,"Dead...");
	
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_font(fnt_cocogoose35);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text(window_get_width()/2,window_get_height()*(3/4),string(player_kill)+" kills             "+"Rank "+string(rank_def));
}

if(!obj_game.game_on)
{
	draw_set_color(c_black);
	draw_set_alpha(0.85);
	draw_rectangle(0,0,window_get_width(),window_get_height(),0)
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_font(fnt_cocogoose70);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text(window_get_width()/2,window_get_height()/2,"They're all dead !");
	
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_font(fnt_cocogoose35);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text(window_get_width()/2,window_get_height()*(3/4),string(player_kill)+" kills             "+"Rank "+string(rank_def));
}

//Draw Pause menu
if(pause)
{
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(0,0,room_width,room_height,0);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_font(fnt_cocogoose70);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text(window_get_width()/2,window_get_height()/2,"Pause");
}