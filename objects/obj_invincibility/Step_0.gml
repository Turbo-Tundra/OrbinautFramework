if (!instance_exists(player))
{
    instance_destroy();
    exit;
}

if (player.item_inv_timer == 0)
{
    instance_destroy();
    exit;
}

// Shift previous shield snapshots backward.
for (var _i = recorded_data_length - 1; _i > 0; _i--)
{
    recorded_data[| _i] = recorded_data[| _i - 1];
}

// Capture this shield object's current appearance.
recorded_data[| 0] = [
    floor(player.x),
    floor(player.y),
    sprite_index,
    floor(image_index)
];