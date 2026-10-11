FOR_EACH_PLAYER
{
	var _player = player_get(_p);
	
    if !collision_player(_player)
    {
        continue;
    }
	
	audio_bgm_stop(1);
	audio_sfx_play(snd_warp_exit);
	fade_perform_white(FADE_DIRECTION.OUT, 3, start_results);
}