function sauvegarder()
{
	var _structToSave = 
	{
		langue : global.language,
	}
	
	var _nbUsi = array_length(ojeu.usi)
	for (var i = 0; i < _nbUsi; i ++)
	{
		_structToSave.usi[i] =
		{
			x : ojeu.usi.x,
			y : ojeu.usi.y,
			rot : ojeu.usi.rot,
			disponible :  ojeu.usi.disponible,
		}
	}
	
	
}

function stringToFichier(_nomFichier, _string)
{

	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, _nomFichier);
	buffer_delete(_buffer);

}