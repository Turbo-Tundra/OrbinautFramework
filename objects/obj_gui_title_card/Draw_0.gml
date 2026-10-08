var _x = camera_get_x(view_current);
var _y = camera_get_y(view_current);
var _w = camera_get_width(view_current);
var _h = camera_get_height(view_current);
var _centre_x = _x + _w * 0.5;
var _centre_y = _y + _h * 0.5;
var _factor_x = _w / 320;
var _factor_y = _h / 224;
var _dx, _dy;

draw_set_font(global.font_data[? spr_font_large]);
draw_set_halign(fa_center);

_dx = _centre_x + 48 - offset_banner * _factor_x;
_dy = _centre_y - 2;

if timer < 8
{
	return;
}

draw_sprite(spr_gui_card_banner, 0, _dx, _dy);

_dx = _centre_x + 0 - offset_zonename * _factor_x;
_dy = _centre_y - 26;

draw_text(_dx, _dy, obj_rm_stage.zone_name);

_dx = _centre_x + 54 - offset_zone * _factor_x;
_dy = _centre_y - 6;
draw_set_halign(fa_right);

draw_text(_dx, _dy, "ZONE");

_dx = _centre_x + 49 + offset_act * _factor_x;
_dy = _centre_y + 8;
	
draw_sprite(spr_gui_act, obj_rm_stage.act_index, _dx, _dy);
draw_set_halign(fa_left);