enum LANGUAGE
{
	FR,
	EN,
	ESP,
}

function initTranslation(_langue)
{
	global.language = _langue;
	
	global.dataTxtOther = load_csv("otherTextData.csv");
	global.dataTxtDial = load_csv("dialoguesData.csv");
	
	var _traductionsOther= ds_map_create();
	var _hauteurDsGridOther = ds_grid_height(global.dataTxtOther);
	for (var i = 0; i < _hauteurDsGridOther; i ++)
	{
		ds_map_add(_traductionsOther, global.dataTxtOther[# 0, i], i);
	}
	
	global.translationsOther = _traductionsOther;
	
	
	var _traductionsDialogues = ds_map_create();
	var _hauteurDsGridDial = ds_grid_height(global.dataTxtDial);
	for (var i = 0; i < _hauteurDsGridDial; i ++)
	{
		ds_map_add(_traductionsDialogues, global.dataTxtDial[# 0, i], i);
	}
	
	global.translationsDial = _traductionsDialogues;
	
}

function string_replace_all_multiple(_string, _array)
{
	var _toReturn = _string
	var _arrayLen = array_length(_array);
	for (var i = 0; i < _arrayLen; i ++)
	{
		_toReturn = string_replace_all(_toReturn, "{" + string(i) + "}", _array[i]);
	}
	
	return _toReturn;
	
}




function text(txtID)
{
	var _txt;
	
	if global.translationsOther[? txtID] != undefined
	{
		_txt = global.dataTxtOther[# 1 + global.language, global.translationsOther[? txtID]];
		if argument_count > 1
		{
			var _array = array_create(argument_count -1);
			for (var i = 1; i < argument_count; i ++)
			{
				_array[i-1] = argument[i]
			}
			_txt = string_replace_all_multiple(_txt, _array);
		}
		return _txt;
	}
	
	if global.translationsDial[? txtID] != undefined
	{
		_txt =	global.dataTxtDial[# 1 + global.language, global.translationsDial[? txtID]];
		if argument_count > 1
		{
			var _array = array_create(argument_count -1);
			for (var i = 1; i < argument_count; i ++)
			{
				_array[i-1] = argument[i]
			}
			_txt = string_replace_all_multiple(_txt, _array);
		}
		return _txt;
	}

	return  "IDENTIFIANT TEXTE " + txtID + "INTROUVABLE";
	
}


