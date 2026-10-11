// Inherit the parent event
event_inherited();
event_animator();
event_culler(CULL_ACTION.PAUSE);


depth = draw_depth(10);
player = noone;
animator.start(sprite_index, 0, 0, 6);