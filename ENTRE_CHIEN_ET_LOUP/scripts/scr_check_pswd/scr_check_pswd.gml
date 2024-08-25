///@param {Array<struct.User>} _users
///@param {String} _username
///@param {String} _password


function check_pswd(_users, _username, _password)
{
	var _nb_users = array_length(_users);
	for (var _i = 0; _i < _nb_users; _i ++)
	{
		var _user = _users[_i]
		if _user.username == _username
			if _user.password == _password return true
			else return false
	}
	show_error("le user n'existe pas", true);
}