#macro BLAISE_COMP_USER_NAME "VBLAISE"
#macro BLAISE_COMP_PASSWORD "BlaiseTaMer"


function get_users()
{
	var _users = array_create(0);
	array_push(_users, new User(BLAISE_COMP_USER_NAME, BLAISE_COMP_PASSWORD));
	return _users;
}