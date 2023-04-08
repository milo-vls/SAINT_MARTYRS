enum PATTERN{
	RECTILIGNE,
	
}

patterns[PATTERN.RECTILIGNE] = new setPattern(
																								1,
																								false,
																								function()	{
																													return [irandom_range(300, 1620), irandom_range(250, 830)]
																								},
																								function(_firstCrime, _idKiller, _colour=c_white)	{
	
																									var _listeCrimesToReturn = [];
																									var _delayMinute	            = irandom_range(3, 5)
																									var _coeffDirX = irandom_range(50, 100)*randomSign();
																									var _coeffDirY = irandom_range(50, 100)*randomSign();
	
																									var _precedentPointX = _firstCrime.x;
																									var _precedentPointY = _firstCrime.y;
																									var _nbCrimeSupp = 1
																									
																									while _precedentPointX < GAME_WIDTH and _precedentPointX > 0 and _precedentPointY < GAME_HEIGHT and _precedentPointY > 0
																									{
																										_precedentPointX += _coeffDirX;
																										_precedentPointY += _coeffDirY;
																										var _date = _firstCrime.date +( _delayMinute*_nbCrimeSupp)
																										array_push( _listeCrimesToReturn, new setCrime(_idKiller, randomNomPrenom(),  _date, false, _precedentPointX, _precedentPointY, true, _colour));
																										
																										_nbCrimeSupp ++;
																									}
																									_listeCrimesToReturn[_nbCrimeSupp-2].last = true;
	
																									return _listeCrimesToReturn
	
																									}
																							);

																	
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												
																												