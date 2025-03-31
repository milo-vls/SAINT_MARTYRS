draw_set_alpha(1);

var _should_draw_default_text = input_text == "";
var _text_to_draw = _should_draw_default_text ? default_text : input_text;

if obj_computer_cursor.instance_id_focus == self.id
	_text_to_draw = input_text;

draw_set_color(_should_draw_default_text ? c_gray : c_black);

draw_set_font(fnt_dialogues);
draw_set_valign(fa_middle); draw_set_halign(fa_left);



draw_self();

draw_text(x + 20, y + sprite_height / 2, _text_to_draw);