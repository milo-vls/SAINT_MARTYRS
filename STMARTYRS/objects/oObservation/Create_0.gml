#region définitif
decaBoxScreen = display_get_gui_width()/6;
lBoxMax = display_get_gui_width()/2.5;
xBoxMin = decaBoxScreen;
xBoxMax = display_get_gui_width() - lBoxMax - decaBoxScreen/1.5;
yBoxMin = decaBoxScreen;
fnt = ftDial;
colFnt = c_white;
draw_set_font(fnt);
sep = string_height("W") - 11;
baseTypingSpeed = 1;
maxTypingSpeed = 3;
decaTxtBox = 20;
wTxtMax = lBoxMax - decaTxtBox *2
#endregion

#region to load
nbPages = 0;
txt[0] = "";
ltxt[0] = 0
fun[0] = noone;
#endregion

#region évolue
txtToDraw = "";
page = 0;
drewChar = 0;
setup = false;
typingSpeed = baseTypingSpeed;
yBoxMax = 0;
hBox = 0;
lBox = 0;
xBox = irandom_range(xBoxMin, xBoxMax);
yBox = irandom_range(yBoxMin, yBoxMax);
xTxt = 0;
yTxt = 0;
#endregion

