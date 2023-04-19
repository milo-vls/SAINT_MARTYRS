//assigne à un perso une room
//CR ===> INITIALES DE CHARACTER ROOM 
function CR(_personnage, _room, _mapx = noone, _mapy=noone){

global.char[_personnage].room = _room;
if _mapy != noone
global.char[_personnage].mapY = _mapy;
if _mapx != noone
global.char[_personnage].mapX = _mapx;


}


// définit, selon le jour
//ROOM DE CHAQUE PERSOS
//tout ce que tu veux en fait, selon le jour
function init_day(){
//reset usi
for (var i = 0; i!=6;i++)
{
	ojeu.usi[i].disponible = true;
}
ojeu.usiPatrol = array_create(0);
ojeu.nbUsiPatrol = 0
//réinitialisation
for (var i = 0; i < ojeu.nbPersonnages; i ++)
{
	global.char[i].nbInteractionCeJour	= 0
}	;
var _nbChar = array_length(global.char);
for (var i = PREMIER_PNJ; i < _nbChar; i ++)
{
	global.char[i].mapX = noone;
	global.char[i].mapY = noone;
	
}
//placement des personnages et autres
switch (ojeu.numeroJour) {
	#region JOURS 1 à 10
    case 1:{
       
	}break;
    case 2:{
       
	}break;
	case 3:{
       
	}break;
	case 4:{
       
	}break;
	#endregion
	#region JOURS 11 à 20
	#endregion
	#region JOURS 21 à 30
	#endregion
	#region JOURS 31 à 40
	#endregion
	#region JOURS 41 à 50
	#endregion
	#region JOURS 51 à 60
	#endregion
	#region JOURS 61 à 72
	#endregion
}



}