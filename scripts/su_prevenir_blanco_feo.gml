// arg0: id quien llama y su blancox, blancoy deben confirmarse ok

var xx = o_control.x;
var yy = o_control.y;
var rr = o_control.r_mundo;
var cc = o_control.c_mundo;

if argument0.blancox > xx + cc {
    if point_distance(argument0.blancox, argument0.blancoy, xx + cc, yy) > rr {
        dd = point_direction(argument0.x, argument0.y, xx + cc, yy);
        argument0.blancox = argument0.x + lengthdir_x(mu_vision * 0.5, dd); 
        argument0.blancoy = argument0.y + lengthdir_y(mu_vision * 0.5, dd); } }
else if argument0.blancox < xx - cc {
    if point_distance(argument0.blancox, argument0.blancoy, xx - cc, yy) > rr {
        dd = point_direction(argument0.x, argument0.y, xx - cc, yy);
        argument0.blancox = argument0.x + lengthdir_x(mu_vision * 0.5, dd); 
        argument0.blancoy = argument0.y + lengthdir_y(mu_vision * 0.5, dd); } }
else if argument0.blancoy < yy - rr {
    argument0.blancox = argument0.x; 
    argument0.blancoy = argument0.y + mu_vision * 0.5; }
else if argument0.blancoy > yy + rr {
    argument0.blancox = argument0.x; 
    argument0.blancoy = argument0.y - mu_vision * 0.5; }

with o_bloque {
    if estado != ms_muerto {
        if point_distance(x, y, argument0.blancox, argument0.blancoy) < si_radio(tipo) {
            argument0.blancox = argument0.x;
            argument0.blancoy = argument0.y;
            break; } } }

