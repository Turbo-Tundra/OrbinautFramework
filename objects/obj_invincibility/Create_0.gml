// Inherit the parent event
event_inherited();
event_animator();

depth = draw_depth(10);
player = noone;
allowed_game_state = GAME_STATE.STOP_OBJECTS;
animator.start(sprite_index, 0, 0, 4);

afterimages = [];
image_index = 0;
last_recorded_frame = -1;