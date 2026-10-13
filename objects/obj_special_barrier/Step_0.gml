if instance_exists(obj_gui_results_special)
{
	instance_destroy();
}

FOR_EACH_PLAYER
{
	var _player = player_get(_p);
	
    if !collision_player(_player)
    {
        continue;
    }
	
	audio_bgm_stop(1);
	audio_sfx_play(snd_warp_exit);
	
	with obj_rm_special
	{
		fade_perform_white(FADE_DIRECTION.OUT, 3, start_results);
	}
}