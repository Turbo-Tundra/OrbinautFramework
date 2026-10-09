// Inherit the parent event
event_inherited();

enum SPECIAL_RESULTS_STATE
{
	LOAD,
	MOVE,
	TALLY,
	WAIT_EXIT,
	EXIT,
	SUPER_MSG
}

#macro SPECIAL_RESULTS_OFFSET_LINE -288

on_fade_start_return = function()
{
	visible = false; fade_perform_black(FADE_DIRECTION.OUT, 1, on_fade_end_return);
}

on_fade_end_return = function()
{
	if !audio_is_playing(snd_warp_enter)
	{
		room_goto(global.previous_room_id);
		return true;
	}
					
	return false;
}

offset_banner = 288;
offset_line = SPECIAL_RESULTS_OFFSET_LINE;
offset_score = 528;	
offset_rings = 544;
offset_continue = 560;
speed_x = 16;
state = SPECIAL_RESULTS_STATE.LOAD;
state_timer = 20;
message_super = false;
message_emerald = false;
ring_bonus = 50;
continues = 0;
total_score = 0;

audio_bgm_play(snd_bgm_act_clear);