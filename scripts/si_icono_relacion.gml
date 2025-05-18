// arg0: valor flotante entre 0 y 1, es recepciones_son
// ret: indice del icono en sprite d_envios

var res;
if argument0 >= 0.8 { res = 4; }
else if argument0 >= 0.6 { res = 6; }
else if argument0 >= 0.4 { res = 2; }
else if argument0 >= 0.2 { res = 3; }
else { res = 5; }
return res;

