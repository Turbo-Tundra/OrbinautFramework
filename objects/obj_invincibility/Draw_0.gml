if player.state != PLAYER_STATE.DEATH
{
	if player.animation == ANIM.IDLE || player.animation == ANIM.DUCK || player.animation == ANIM.LOOK_UP || player.action == ACTION.SPIN_DASH || player.action == ACTION.DASH
	{
		if sprite_index != -1
		{
			draw_sprite_ext(sprite_index, image_index, floor(player.x), floor(player.y), image_xscale, image_yscale, image_angle, draw_colour, image_alpha);
		}
	}
	else
	{
		for (var i = 0; i < array_length(afterimages); i++)
		{
			var _ghost = afterimages[i];
			draw_sprite_ext(_ghost.sprite, _ghost.frame, _ghost.x, _ghost.y, _ghost.xscale, _ghost.yscale, _ghost.angle, c_white, _ghost.alpha);
		}
	}
}