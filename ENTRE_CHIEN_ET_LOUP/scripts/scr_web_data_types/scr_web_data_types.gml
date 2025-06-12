enum WEB_DATA_TYPES
{
	SCRIBBLE,
	ANIMATED_SPRITE,
	SPRITE_IMAGE,
	
	
	NB_WEB_DATA_TYPES
}

///@param _scribble 
function WebScribble(_scribble) constructor
{
	scribble_text = _scribble.align(fa_left, fa_top);
}

///@param {Asset.GMSprite} _sprite
///@param {real} _image_index
function WebSpriteImage(_sprite, _image_index) constructor
{
	sprite = _sprite;
	image_index = _image_index;
}

///@param {Asset.GMSprite} _sprite
///@param {real} _animation_speed
function WebAnimatedSprite(_sprite, _animation_speed) constructor
{
	sprite = _sprite;
	animation_speed = _animation_speed;
	
	nb_images = sprite_get_number(_sprite);
}