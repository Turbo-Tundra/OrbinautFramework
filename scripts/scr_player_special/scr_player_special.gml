/// @self obj_player
function scr_player_special()
{
	if action != ACTION.SPECIAL
	{
		y += radius_y - radius_y_spin;	
		radius_x = radius_x_spin;
		radius_y = radius_y_spin;
		animation = ANIM.SPECIAL_SPIN;
		action = ACTION.SPECIAL;
	}
}