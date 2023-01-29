enum PATTERN{
	RECTILIGNE,
	ZONE_CARRE,
	
}

patterns[PATTERN.RECTILIGNE] = new setPattern(
																								1,
																								false,
																								function()	{
																													return [irandom_range(300, 1620), irandom_range(250, 830)]
																								},
																								function(_firstCrime, _idKiller)	{
	
																									var _listeCrimesToReturn = [];
																									var _delayMinute	            = irandom_range(5, 10)
																									var _coeffDirX = irandom_range(-100, 100);
																									var _coeffDirY = irandom_range(-100, 100);
	
																									var _precedentPointX = _firstCrime.x;
																									var _precedentPointY = _firstCrime.y;
																									var _nbCrimeSupp = 1
																									
																									while _precedentPointX < GAME_WIDTH and _precedentPointX > 0 and _precedentPointY < GAME_HEIGHT and _precedentPointY > 0
																									{
																										_precedentPointX += _coeffDirX;
																										_precedentPointY += _coeffDirY;
																										var _date = date_inc_minute(_firstCrime.date, _delayMinute*_nbCrimeSupp)
																										array_push( _listeCrimesToReturn, new setCrime(_idKiller, randomNomPrenom(),  _date, false, _precedentPointX, _precedentPointY, 30, true));
																										
																										_nbCrimeSupp ++;
																									}
																									_listeCrimesToReturn[_nbCrimeSupp-2].last = true;
	
																									return _listeCrimesToReturn
	
																									}, 
																								10
																							);

patterns[PATTERN.ZONE_CARRE] = new setPattern(
																											2,
																											false,
																											function()	{
																													return [irandom_range(300, 1620), irandom_range(250, 830)]
																											},
																											function(_premierCrime, _killerID) {
																													var _listeCrimesToReturn = [];
																													var _delayMinute = irandom_range(5, 7);
																													var _coteCarre = irandom_range(75, 150);
																													var _precedentPointX = _premierCrime.x;
																													var _precedentPointY = _premierCrime.y;
																													var _facteurLargeur = random_range(-1, 1);
																													var _facteurHauteur = random_range(-1, 1);
																													var _x1Carre = _precedentPointX + (_coteCarre*_facteurLargeur);
																													var _y1Carre = _precedentPointY + (_coteCarre*_facteurHauteur);
																													var _x2Carre = _x1Carre + _coteCarre * ( _facteurLargeur<=1 ? 1 : -1);
																													var _y2Carre = _y1Carre + _coteCarre *  ( _facteurHauteur<=1 ? 1 : -1);
																													
																													var _nbCrimeSupp = 1
																													repeat(25)
																													{
																														
																														array_push(_listeCrimesToReturn, new setCrime(_killerID, randomNomPrenom(), date_inc_minute(_premierCrime.date, _delayMinute*_nbCrimeSupp), false, irandom_range(min(_x1Carre, _x2Carre), max(_x1Carre, _x2Carre)), irandom_range(min(_y1Carre, _y2Carre), max(_y1Carre, _y2Carre)), 10, true));
																														_nbCrimeSupp ++;
																													}
																													_listeCrimesToReturn[_nbCrimeSupp-2].last = true;
																													return _listeCrimesToReturn;
																												},
																												10
																												);
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												