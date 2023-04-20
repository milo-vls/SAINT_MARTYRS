
function txtEnzino() begin



switch(global.char[p.Enzino].proximite)
{
	
	case 0:{	
	}break;
	case 1:{
	}break;
	case 2:{
	}break;
	default:instance_destroy();break;

}


global.char[p.Enzino].proximite ++;

end