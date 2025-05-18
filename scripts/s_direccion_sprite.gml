//para calcular la direccion de entre 8 sprites
//arg0: angulo dado
//ret: numero 0 a 7

var resultado;
if argument0 <= 22 {
    resultado = 0; }
else if argument0 <= 68 {
    resultado = 1; }
else if argument0 <= 112 {
    resultado = 2; }
else if argument0 <= 158 {
    resultado = 3; }
else if argument0 <= 202 {
    resultado = 4; }
else if argument0 <= 248 {
    resultado = 5; }
else if argument0 <= 292 {
    resultado = 6; }
else if argument0 <= 338 {
    resultado = 7; }
else {
    resultado = 0; }
return resultado;

