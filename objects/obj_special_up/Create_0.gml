// Inherit the parent event
event_inherited();
event_animator();
event_culler(CULL_ACTION.PAUSE);

animator.start(sprite_index, 0, 0, 8);
depth = draw_depth(10);