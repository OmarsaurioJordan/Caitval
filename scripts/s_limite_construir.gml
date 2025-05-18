// arg0, arg1: posicion x,y a ver si sale del limite
// ret: true si se sale

var xx = o_control.x;
var yy = o_control.y;
var rr = o_control.r_mundo;
var cc = o_control.c_mundo;
var res = false;

if argument0 > xx + cc {
    if point_distance(argument0, argument1, xx + cc, yy) > rr {
        res = true; } }
else if argument0 < xx - cc {
    if point_distance(argument0, argument1, xx - cc, yy) > rr {
        res = true; } }
else if argument1 < yy - rr {
    res = true; }
else if argument1 > yy + rr {
    res = true; }
return res;

