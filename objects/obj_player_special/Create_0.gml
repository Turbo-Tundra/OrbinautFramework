// Inherit the parent event
event_inherited();
event_animator();

/*
[!] Use CTRL+M to collapse regions [!]
*/

#region PALETTES

if !variable_instance_exists(id, "player_index")
{
	player_index = PLAYER_COUNT;
	base_depth = draw_depth(20 + player_index);
	
	// Cache player count to save iteration time (instance_number is O(n))
	PLAYER_COUNT++;
}
else
{
	ds_list_destroy(recorded_data);
}

switch player_type
{
	case PLAYER.TAILS:
		
		radius_x = 8;
		radius_y = 15;
		palette_slots = [4, 5, 6];
			
	break;
		
	case PLAYER.KNUCKLES:
		
		radius_x = 8;
		radius_y = 15;
		palette_slots = [7, 8, 9];
			
	break;
		
	case PLAYER.AMY:
		
		radius_x = 8;
		radius_y = 13;
		palette_slots = [10, 11, 12];
		
	break;
		
	// PLAYER.SONIC, others
	default:
		
		radius_x = 8;
		radius_y = 15;
		palette_slots = [0, 1, 2, 3];
}

#endregion
	
radius_wall = radius_x + 1;

state = PLAYER_STATE.DEFAULT;
is_grounded = false;
is_jumping = false;
air_lock_flag = true;

on_object = noone;
extra_mask = noone;
interact_flag = true;

vel_x = 0;
vel_y = 0;
spd = 0;
angle = 0;
floor_angle_side = -1;
grv = PARAM_GRV_DEFAULT;

acc = 0;
acc_air = 0;
dec = 0;
dec_roll = 0;
frc = 0;
frc_roll = 0;
acc_top = 0;
jump_min_vel = 0;
jump_vel = 0;

score_combo = 0;
score_values = [10, 100, 200, 500, 1000, 10000];
action = ACTION.NONE;
action_state = 0;

input_lock_control = false;
input_press = input_create();
input_down = input_create();

facing = 1;
animation = ANIM.SPIN;
visual_angle = 0;
set_push_anim_by = noone;

recorded_data = ds_list_create();
recorded_data_length = player_index == 0 ? PLAYER_MAX_COUNT * PARAM_CPU_DELAY : PARAM_RECORD_LENGTH;

debug_mode_ind = 0;
debug_mode_spd = 0;
debug_mode_array = [];
	
if player_index == 0
{
	// Base object set. More added dynamically in Room Start event
	array_push(debug_mode_array,
		obj_ring);
}

// Fill up initial record data
for (var _i = 0; _i < recorded_data_length; _i++)
{
	record_data(_i);
}

if player_type == PLAYER.TAILS
{
	with obj_tail
	{
		if player == other.id
		{
			instance_destroy();
		}
	}
		
	with instance_create(x, y, obj_tail)
	{
		player = other.id;
	}
}

if player_index == 0 && global.player_cpu != PLAYER.NONE
{
	player_spawn_special(x - 16, ystart, global.player_cpu);
}
	
// Set default animation and hitbox
scr_player_animate();
scr_player_update_hitbox();