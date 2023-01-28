enum PATTERN{
	RECTILIGNE,
	
}

patterns[PATTERN.RECTILIGNE] = new setPattern(
																								1,
																								false,
																								function()	{
																													return [irandom_range(300, 1620), irandom_range(250, 830)]
																													},
																								function(_firstCrime, _idKiller)	{
	
																									var _listeCrimesToReturn = [];
																									var _delaySeconde             = irandom_range(3, 10)
																									var _coeffDirX = irandom_range(-100, 100);
																									var _coeffDirY = irandom_range(-100, 100);
	
																									var _precedentPointX = _firstCrime.x;
																									var _precedentPointY = _firstCrime.y;
																									var _nbCrimeSupp = 1
																									
																									while _precedentPointX < GAME_WIDTH and _precedentPointX > 0 and _precedentPointY < GAME_HEIGHT and _precedentPointY > 0
																									{
																										_precedentPointX += _coeffDirX;
																										_precedentPointY += _coeffDirY;
																										var _date = date_inc_second(_firstCrime.date, _delaySeconde*_nbCrimeSupp)
																										array_push( _listeCrimesToReturn, new setCrime(_idKiller, randomNomPrenom(),  _date, false, _precedentPointX, _precedentPointY, 30, true));
																										
																										_nbCrimeSupp ++;
																									}
	
																									return _listeCrimesToReturn
	
																									}, 
																								30
																							);

