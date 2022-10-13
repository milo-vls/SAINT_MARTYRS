/*
Renvoie true si le joueur est libre de ses mouvements, actions. Utile pour savoir si on veut savoir si on peut entamer une
séquence sans causer de problème.
Renvoie faux autrement
*/
function player_free(){
var _check = !instance_exists(oParentManagerMG);
var _check0 = !instance_exists(oGoToRoom)
var _check1 = !instance_exists(oDial);
return  (_check0 and _check1 and _check and room != pstart )

}
	
function player_free_map(){
if room == pcarte	
return (omapManager.selectedUsi == noone and omapManager.currentMenu == noone);
else
return true;
}