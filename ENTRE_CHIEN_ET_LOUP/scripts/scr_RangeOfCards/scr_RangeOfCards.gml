function RangeOfCards(_texts, _methods,_card_meta_datas = array_create(array_length(_texts)), _left_side = true, _font = fnt_dialogues, _minimum_padding = TEXT_BUBBLE_MARGIN/1.5) constructor
{
	methods = _methods;
	card_meta_datas = _card_meta_datas;
	left_side = _left_side;
	font = _font;
	minimum_padding = _minimum_padding;
	
	maximum_padding = _minimum_padding * 2;
	scribbles = array_length(_texts);
	nb_cards = array_length(_texts);
	paddings = array_create(nb_cards, minimum_padding);
	x_positions = array_create(nb_cards);
	
	content_widths = array_create(nb_cards);
	content_heights = array_create(nb_cards);
	
	//                  V border padding Vpadding for each side of each cards    V space between cards
	var _nb_paddings =  2            +   2 * nb_cards                          + nb_cards
	var _card_max_width = (GAME_WIDTH - _nb_paddings*_minimum_padding)/nb_cards;
	draw_set_font(_font);
	for (var _card_id = 0; _card_id < nb_cards; _card_id ++)
	{
		scribbles[_card_id] = scribble("[shake][" + font_get_name(_font) + "]" + _texts[_card_id]).align(fa_center, fa_middle);
		
		
		content_widths[_card_id] = min(scribbles[_card_id].get_width(), _card_max_width);
		content_heights[_card_id] = scribbles[_card_id].wrap(content_widths[_card_id]).get_height();
		if _card_id == 0
			x_positions[0] = (_minimum_padding * 2.5) + content_widths[0]/2;	
		else
			x_positions[_card_id] = (x_positions[_card_id-1] + content_widths[_card_id-1]/2) + (_minimum_padding*3) + content_widths[_card_id]/2;
	}
	
	
	
}

///@param {struct.RangeOfCards} _range_of_cards
function draw_range_of_cards(_range_of_cards, _hovered_card_id)
{
	static	_hovered_card_outline_colors = [make_color_rgb(115,26,50), make_color_rgb(100,15,20), make_color_rgb(125,10,20), make_color_rgb(150,36,60)];
	
	
	var _nb_cards = _range_of_cards.nb_cards;
	var _padding = 0;
	
	draw_set_font(_range_of_cards.font);

	
	for (var _card_id = 0; _card_id < _nb_cards; _card_id ++)
	{
		scribble_anim_shake(0, 0);
		if _card_id == _hovered_card_id
			continue;
		draw_card(_range_of_cards.x_positions[_card_id], _range_of_cards.paddings[_card_id], _range_of_cards.content_widths[_card_id], _range_of_cards.content_heights[_card_id], _range_of_cards.scribbles[_card_id]);
	}
	if _hovered_card_id > -1
	{
		scribble_anim_reset();
		draw_card(
			_range_of_cards.x_positions[_hovered_card_id], 
			_range_of_cards.paddings[_hovered_card_id], 
			_range_of_cards.content_widths[_hovered_card_id], 
			_range_of_cards.content_heights[_hovered_card_id], 
			_range_of_cards.scribbles[_hovered_card_id], 
			_hovered_card_outline_colors
		);
	}
}

function draw_card(_x_position, _padding, _content_width, _content_height, _scribble, _outline_colors = [c_white, c_white, c_white, c_white])
{
	var _x_left = _x_position - _padding - _content_width/2;
	var _y_top = GAME_HEIGHT - _padding * 2 - _content_height;
	draw_rectangle_color(_x_left, _y_top, _x_left + _padding*2 + _content_width, GAME_HEIGHT, c_black, c_black, c_black, c_black, false);
	
	
	draw_rectangle_color(_x_left, _y_top, _x_left + _padding*2 + _content_width, GAME_HEIGHT, _outline_colors[0], _outline_colors[1], _outline_colors[2], _outline_colors[3], true);

	draw_set_color(_outline_colors[0]);
	_scribble.draw(_x_position, GAME_HEIGHT - _padding - _content_height/2);
}

function range_of_cards_update_padding(_range_of_cards, _hovered_card_id)
{
	static _card_growth_speed = 5;
	var _nb_cards = _range_of_cards.nb_cards;
	
	for (var _card_id = 0; _card_id < _nb_cards; _card_id ++)
	{
		if _card_id == _hovered_card_id
			_range_of_cards.paddings[_card_id] = approach(_range_of_cards.paddings[_card_id], _range_of_cards.maximum_padding, _card_growth_speed);
		else
			_range_of_cards.paddings[_card_id] = approach(_range_of_cards.paddings[_card_id], _range_of_cards.minimum_padding, _card_growth_speed);
	}
}

function range_of_cards_get_hovered_card_id(_range_of_cards, _px, _py)
{
	var _nb_cards = _range_of_cards.nb_cards;
	
	for (var _card_id = 0; _card_id < _nb_cards; _card_id ++)
	{
		var _padding = _range_of_cards.paddings[_card_id];
		var _x_left = _range_of_cards.x_positions[_card_id] - _padding - _range_of_cards.content_widths[_card_id]/2;
		var _y_top = GAME_HEIGHT - _padding * 2 -  _range_of_cards.content_heights[_card_id];		
		if point_in_rectangle(_px, _py, _x_left, _y_top, _x_left + _padding*2 + _range_of_cards.content_widths[_card_id], GAME_HEIGHT)
			return _card_id;
	}
	
	return -1;
}

function range_of_cards_use_card_method(_range_of_cards, _card_id)
{
	return _range_of_cards.methods[_card_id](_range_of_cards.card_meta_datas[_card_id]);
}

function range_of_cards_get_highest_card_height(_range_of_cards)
{
	var _nb_cards = _range_of_cards.nb_cards;
	var _content_heights = _range_of_cards.content_heights;
	var _minimum_y_found = GAME_HEIGHT;	
	for (var _card_id = 0; _card_id < _nb_cards; _card_id ++)
	{
		var _padding = _range_of_cards.paddings[_card_id];
		var _y_top = GAME_HEIGHT - _padding * 2 - _content_heights[_card_id];
		if _y_top < _minimum_y_found
			_minimum_y_found = _y_top;
	}
	return GAME_HEIGHT - _minimum_y_found;
}

function template_range_of_card()
{	
	return new RangeOfCards(["card 0", "card 1", "card 2"], [function(){}, function(){}, function(){}]);
}

