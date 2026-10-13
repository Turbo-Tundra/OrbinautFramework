max_allowed_game_state = GAME_STATE.NORMAL;
animator = noone;
culler = noone;

#region MACRO & ENUM

#macro PARAM_GRV_DEFAULT GLOBAL_PARAM_GRV
#macro CAMERA_VIEW_TIMER_DEFAULT 120
#macro PARAM_CPU_DELAY 16
#macro PARAM_RECORD_LENGTH 32

enum PLAYER
{
	SONIC = 0,
	TAILS = 1,
	KNUCKLES = 2,
	AMY = 3,
	NONE = 255
}

enum PLAYER_STATE
{
	DEFAULT,
	HURT,
	MANUAL_INTERACT,
	MANUAL_NO_INTERACT,
	DEBUG_MODE,
	DEATH,
	RESPAWN
}

enum CPU_STATE
{
	MAIN,
	STUCK,
	RESPAWN_INIT,
	RESPAWN
}

enum CPU_BEHAVIOUR
{
	S2,
	S3
}

enum PHYSICS
{
	S1,
	CD,
	S2,
	S3,
	SK
}

#endregion

#region METHODS

set_velocity = function()
{
	vel_x = spd * dcos(angle);
	vel_y = spd * -dsin(angle);
}

get_rotation_bounds = function()
{
	return [22.5, 337.5 + (ANGLE_INCREMENT * global.player_physics == PHYSICS.S1)];
}

#endregion