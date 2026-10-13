/// @description Begin Step (Post-Framework)
scr_player_input();

switch state
{
	case PLAYER_STATE.DEFAULT:
	case PLAYER_STATE.MANUAL_INTERACT:
	case PLAYER_STATE.MANUAL_NO_INTERACT:
	
		if scr_player_debug_mode_enter()
		{
			break;
		}
		
		scr_player_parameters();
		
		if state == PLAYER_STATE.DEFAULT
		{
			switch is_grounded
			{
				// Grounded
				case true:
				
					if scr_player_jump_start()
					{
						break;
					}
					
					scr_player_slope_resist();
					scr_player_movement_ground_regular();
					scr_player_collision_ground_walls();
					
					if scr_player_level_bound()
					{
						break;
					}
					
					scr_player_position();
					scr_player_collision_ground_floor();
					scr_player_slope_repel();
					
				break;
				
				// Airborne
				case false:
				
					if scr_player_jump()
					{
						break;
					}
					
					scr_player_movement_air();
					
					if scr_player_level_bound()
					{
						break;
					}
						
					scr_player_position();
					
				break;
			}
		}
		
		scr_player_update_status();
		scr_player_animate();

		record_data(0);
		
	break;
	
	case PLAYER_STATE.DEBUG_MODE:
		scr_player_debug_mode();
	break;
}

scr_player_palette();

// Reset flag
interact_flag = true;