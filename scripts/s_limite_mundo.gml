// arg0: id quien llama y sera limitado al borde

var xx = o_control.x;
var yy = o_control.y;
var rr = o_control.r_mundo;
var cc = o_control.c_mundo;
var dd;

if argument0.x > xx + cc {
    if point_distance(argument0.x, argument0.y, xx + cc, yy) > rr {
        dd = point_direction(xx + cc, yy, argument0.x, argument0.y);
        argument0.x = xx + cc + lengthdir_x(rr, dd); 
        argument0.y = yy + lengthdir_y(rr, dd); } }
else if argument0.x < xx - cc {
    if point_distance(argument0.x, argument0.y, xx - cc, yy) > rr {
        dd = point_direction(xx - cc, yy, argument0.x, argument0.y);
        argument0.x = xx - cc + lengthdir_x(rr, dd); 
        argument0.y = yy + lengthdir_y(rr, dd); } }
else if argument0.y < yy - rr {
    argument0.y = yy - rr; }
else if argument0.y > yy + rr {
    argument0.y = yy + rr; }

