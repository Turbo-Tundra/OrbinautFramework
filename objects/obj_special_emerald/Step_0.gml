// Individual colors for each Chaos Emerald
if global.emerald_count == 1
{
	sprite_index = spr_emerald_yellow;
}
else if global.emerald_count == 2
{
	sprite_index = spr_emerald_pink;
}
else if global.emerald_count == 3
{
	sprite_index = spr_emerald_green;
}
else if global.emerald_count == 4
{
	sprite_index = spr_emerald_red;
}
else if global.emerald_count == 5
{
	sprite_index = spr_emerald_grey;
}
else if global.emerald_count >= 6
{
	sprite_index = spr_emerald_aqua;
}
else
{
	sprite_index = spr_emerald_blue;
}

FOR_EACH_PLAYER
{
	var _player = player_get(_p);
	
	audio_sfx_play(snd_bgm_emerald);
	instance_create(x, y, obj_sparkle);
	instance_destroy();
	
	return;
}