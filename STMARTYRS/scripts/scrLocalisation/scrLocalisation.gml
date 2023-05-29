enum LANGUAGE
{
	FR,
	EN,
	ESP,
}

function initTranslation(_langue)
{
	language = _langue;
	
	dataTxtOther = load_csv("otherTextData.csv");
	dataTxtDial = load_csv("dialoguesData.csv");
	
	var _traductionsOther= ds_map_create();
	var _hauteurDsGridOther = ds_grid_height(dataTxtOther);
	for (var i = 0; i < _hauteurDsGridOther; i ++)
	{
		ds_map_add(_traductionsOther, dataTxtOther[# 0, i], i);
	}
	
	translationsOther = _traductionsOther;
	
	
	var _traductionsDialogues = ds_map_create();
	var _hauteurDsGridDial = ds_grid_height(dataTxtDial);
	for (var i = 0; i < _hauteurDsGridDial; i ++)
	{
		ds_map_add(_traductionsDialogues, dataTxtDial[# 0, i], i);
	}
	
	translationsDial = _traductionsDialogues;
	
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
	
	if ojeu.translationsOther[? txtID] != undefined
	{
		_txt = ojeu.dataTxtOther[# 1 + ojeu.language, ojeu.translationsOther[? txtID]];
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
	
	if ojeu.translationsDial[? txtID] != undefined
	{
		_txt =	ojeu.dataTxtDial[# 1 + ojeu.language, ojeu.translationsDial[? txtID]];
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


