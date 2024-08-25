///@param {Array<struct.User>} _users
///@param {String} _username
function does_user_exists(_users, _username)
{
	var _nb_users = array_length(_users);
	for (var _user_i = 0; _user_i < _nb_users; _user_i ++)
	{
		if _users[_user_i].username == _username
			return true;
	}
	return false;
}