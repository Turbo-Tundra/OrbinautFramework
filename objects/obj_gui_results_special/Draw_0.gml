if state == SPECIAL_RESULTS_STATE.LOAD
{
    return;
}

var _x = camera_get_x(view_current);
var _y = camera_get_y(view_current);
var _w = camera_get_width(view_current);
var _h = camera_get_height(view_current);
var _centre_x = _x + _w * 0.5;
var _centre_y = _y + _h * 0.5;
var _factor_x = _w / 320;
var _player_text, _dx, _dy;

_dx = _centre_x + offset_banner * _factor_x;
_dy = _centre_y - 61;

draw_sprite(spr_gui_card_banner, 1, _dx, _dy);
draw_set_halign(fa_center);

_dx = _centre_x + offset_line * _factor_x;
_dy = _centre_y - 68;

switch global.player_main
{
    case PLAYER.TAILS:
        _player_text = "TAILS";
    break;
	
    case PLAYER.KNUCKLES:
        _player_text = "KNUCKLES";
    break;
	
    case PLAYER.AMY:
        _player_text = "AMY";
    break;
	
	// PLAYER.SONIC, others
	default:
		_player_text = "SONIC";
}

draw_set_font(global.font_data[? spr_font_large_alt]);
draw_set_halign(fa_center);

if message_super
{
    draw_text(_dx, _dy, "SUPER UNLOCKED");
}
else if global.emerald_count == 7
{
    draw_text(_dx, _dy, string(_player_text) + " GOT THEM ALL");
}
else
{
    draw_text(_dx, _dy, message_emerald ? "CHAOS EMERALDS" : "SPECIAL STAGE");
}

_dx = _centre_x + offset_score * _factor_x;
_dy = _centre_y + 26;

draw_set_font(global.font_data[? spr_font_digits_alt]);
draw_set_halign(fa_right);
draw_sprite(spr_gui_results_score_special, 0, _dx - 66, _dy);
draw_text(_dx + 85, _dy - 7, total_score);

_dx = _centre_x + offset_rings * _factor_x;
_dy = _centre_y + 44;

draw_sprite(spr_gui_results_rings_special, 0, _dx - 46, _dy);
draw_text(_dx + 85, _dy - 7, ring_bonus);

_dx = _centre_x + offset_continue * _factor_x;
_dy = _centre_y + 62;

draw_sprite(spr_gui_results_continue_special, 0, _dx - 54, _dy);
draw_text(_dx + 85, _dy - 7, continues);

_dx = _centre_x;
_dy = _centre_y - 16;

draw_set_alpha(FRAME_COUNTER % 2 == 0 ? 1 : 0);

for (var _i = 0; _i < global.emerald_count; _i++)
{
    switch _i
    {
        case 0: draw_sprite(spr_gui_emerald, _i, _dx - 24, _dy); break;
        case 1: draw_sprite(spr_gui_emerald, _i, _dx + 24, _dy); break;
        case 2: draw_sprite(spr_gui_emerald, _i, _dx - 48, _dy); break;
        case 3: draw_sprite(spr_gui_emerald, _i, _dx + 48, _dy); break;
        case 4: draw_sprite(spr_gui_emerald, _i, _dx - 72, _dy); break;
        case 5: draw_sprite(spr_gui_emerald, _i, _dx + 72, _dy); break;
        case 6: draw_sprite(spr_gui_emerald, _i, _dx, _dy); break;
    }
}

draw_set_alpha(1);