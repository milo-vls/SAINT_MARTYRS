

function aLaLigne(str, lMax)
{

var str_len = string_length(str);
var last_space = 1;

var compte = 1;
var subStr;

repeat(str_len)
{
	subStr = string_copy(str, 1, compte);
	
	if string_char_at(str, compte) == " "
	{
		last_space = compte;
	}
	
	if string_width(subStr) > lMax
	{
		str = string_delete(str, last_space, 1);
		str = string_insert("\n", str, last_space);
		compte += 1;
	}
	compte ++;
}

return str;

}