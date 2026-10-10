enum SPECIAL_STAGE_STATE
{
	IDLE,
	RESULTS,
	EMERALD,
	ALL_EMERALDS
}

start_results = function()
{
	if !audio_is_playing(snd_warp_exit)
	{
		var _previous_state = state;
	
		if state == SPECIAL_STAGE_STATE.EMERALD
		{
			global.emerald_count = min(global.emerald_count + 1, 7);
		}
		else if state == SPECIAL_STAGE_STATE.ALL_EMERALDS
		{
			global.emerald_count = 7;
		}
	
		state = SPECIAL_STAGE_STATE.RESULTS;
	
		bg_clear_all();
		deform_clear_all();
		fade_perform_white(FADE_DIRECTION.IN, 0);
	
		with instance_create(0, 0, obj_gui_results_special)
		{
			message_emerald = _previous_state >= SPECIAL_STAGE_STATE.EMERALD;
		};
	
		return true;
	}
	
	return false;
}

state = SPECIAL_STAGE_STATE.IDLE;
bg_scroll_special = 0;

bg_convert("Clouds_1", 0, 0, -0.5, 0, 0);
bg_convert("Clouds_2", 0, 0, -0.5, 0, 0);
bg_convert("Clouds_3", 0, 0, -0.375, 0, 0);
bg_convert("Clouds_4", 0, 0, -0.375, 0, 0);
bg_convert("Clouds_5", 0, 0, -0.1, 0, 0);
bg_convert("Clouds_6", 0, 0, -0.05, 0, 0);
bg_convert("Bubbles", 0, 0, 0, -0.5, 0);
bg_convert("Foreground_Animals", 0, 0, bg_scroll_special, 0, 0);

sprite_set_animation(spr_bg_special_1, 6);
sprite_set_animation(spr_bg_special_2, 6);
sprite_set_animation(spr_bg_special_3, 6);
sprite_set_animation(spr_bg_special_4, 6);
sprite_set_animation(spr_bg_special_5, 6);
sprite_set_animation(spr_bg_special_6, 6);
sprite_set_animation(spr_bg_special_7, 6);
sprite_set_animation(spr_bg_special_8, 6);

discord_set_data("SPECIAL STAGE", "", "room_special", undefined);
audio_bgm_play(snd_bgm_special_stage);
fade_perform_white(FADE_DIRECTION.IN, 1);