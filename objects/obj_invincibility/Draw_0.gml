if instance_exists(player) && player.state != PLAYER_STATE.DEATH
{
	if sprite_index != -1
	{
		draw_sprite_ext(sprite_index, image_index, floor(player.x), floor(player.y), image_xscale, image_yscale, image_angle, draw_colour, image_alpha);
	}
	
    for (var _delay = 9; _delay >= 3; _delay -= 3)
    {
        var _data = recorded_data[| _delay];

        var _x = _data[0];
        var _y = _data[1];
        var _sprite = _data[2];
		var _frame = _data[3];

        draw_sprite_ext(_sprite, _frame, _x, _y, image_xscale, image_yscale, image_angle, draw_colour, image_alpha);
    }
}