//Hit detection
	//Body hit
mask_index = spr_targetby;
if(place_meeting(x,y,obj_projectile))
{
	last_projectile_hit = instance_nearest(x,y,obj_projectile);
	health_point -= last_projectile_hit.dmg;
	if(health_point <= 0) last_projectile_hit.shooter.player_kill++;
	audio_play_sound(snd_hit,0,0);
	instance_destroy(last_projectile_hit);
}
	
	//Headshot
mask_index = spr_targeths;
if(place_meeting(x,y,obj_projectile))
{
	last_projectile_hit = instance_nearest(x,y,obj_projectile);
	health_point -= last_projectile_hit.dmg*3;
	if(health_point <= 0) last_projectile_hit.shooter.player_kill++;
	audio_play_sound(snd_hit,0,0);
	audio_play_sound(snd_ding,0,0);
	instance_destroy(last_projectile_hit);
}
	//Reset collision mask
mask_index = spr_target;

//Area detection
if(point_distance(x,y,obj_game.x_center,obj_game.y_center) > obj_game.area_radius)
{
	health_point -= obj_game.area_damage;
	speed = 4;
	direction = point_direction(x,y,obj_game.x_center,obj_game.y_center);
}

//Health
	//When 0HP
if(health_point<=0)
{
	instance_destroy();
	obj_game.player_alive--;
}
	//Regeneration of health
if(health_point<health_max && can_regen) health_point += health_regen;
	//Overflow management
if(health_point>health_max) health_point = health_max;
if(health_point<0) health_point = 0;

//Movement
if (instance_exists(obj_player))
{
	if (distance_to_object(obj_player) > 500) && (distance_to_object(obj_player) < 1000)
	{
		direction = point_direction(x,y,obj_player.x,obj_player.y);
		speed = 4;
	}
}


