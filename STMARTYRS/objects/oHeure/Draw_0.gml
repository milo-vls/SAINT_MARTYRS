draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(1);
var _heure = string(date_get_hour(global.mapDate));
var _minute = string(date_get_minute(global.mapDate));
var _addHour = ("0" ? string_length(_heure) == 0 : "");
var _addMinute = ("0" ? string_length(_minute) == 0 : "");
var _toDraw =_addHour+ _heure +":\n" +  _addMinute + _minute;
 draw_self();
draw_text(xText, yText, _toDraw);





