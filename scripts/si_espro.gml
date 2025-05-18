// ret: 0.8 (80%) si es jugador pro, sino 1, si arg0: false
// ret: 1.2 (120%) si es jugador pro, sino 1, si arg0: true

var pro = 1;
if o_control.espro != 0 {
    if argument0 {
        pro = 1.2; }
    else {
        pro = 0.8; } }
return pro;

