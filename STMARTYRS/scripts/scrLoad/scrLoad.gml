function charger()
{
	
}


function fichierToJson(_nomFichier)
{
	var _buffer = buffer_load(_nomFichier);
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	var _json = json_parse(_string);
	return _json;

}