// Inherit the parent event
event_inherited();
event_animator();

depth = draw_depth(10);
player = noone;
allowed_game_state = GAME_STATE.STOP_OBJECTS;
animator.start(sprite_index, 0, 0, 6);

recorded_data = ds_list_create();
recorded_data_length = PARAM_RECORD_LENGTH;

for (var _i = 0; _i < recorded_data_length; _i++)
{
    recorded_data[| _i] = [
        floor(x),
        floor(y),
        sprite_index,
        image_index
    ];
}