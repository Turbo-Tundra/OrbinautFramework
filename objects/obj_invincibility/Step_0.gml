if !instance_exists(player) || player.item_inv_timer <= 0
{
	instance_destroy();
	exit;
}

// Create an afterimage when the animation advances
if (floor(image_index) != last_recorded_frame)
{
    last_recorded_frame = floor(image_index);

    var _ghost = {
        x: player.x,
        y: player.y,
        sprite: sprite_index,
        frame: 0,
		timer: 0,
		frame_duration: 6,
        xscale: image_xscale,
        yscale: image_yscale,
        angle: image_angle,
        alpha: 1
    };

    array_push(afterimages, _ghost);

    // Update alpha values of all afterimages
    var _count = array_length(afterimages);

    for (var i = 0; i < _count; i++)
    {
        afterimages[i].alpha = i / 2;
    }

	// Keep only the latest 3 afterimages
	if (array_length(afterimages) > 3)
	{
		array_delete(afterimages, 0, 1);
	}
}

for (var i = 0; i < array_length(afterimages); i++)
{
    var _ghost = afterimages[i];

    _ghost.timer++;

    if (_ghost.timer >= _ghost.frame_duration)
    {
        _ghost.timer = 0;
        _ghost.frame++;

        // Loop the animation
        if (_ghost.frame >= sprite_get_number(_ghost.sprite))
        {
            _ghost.frame = 0;
        }
    }

    afterimages[i] = _ghost;
}