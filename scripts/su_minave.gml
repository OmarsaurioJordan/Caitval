// ret: id de la nave hallada o creada
// arg0: id quien llama, a ver si hay nave disponible

var ret = noone;
var hay = false;
with o_transmision {
    if nombre_destino == argument0.retorno {
        hay = true;
        argument0.blancox = x;
        argument0.blancoy = y;
        ret = id;
        break; } }
if !hay {
    var dd = random(360);
    var xx = o_control.x + lengthdir_x(room_width, dd);
    var yy = o_control.y + lengthdir_y(room_width, dd);
    ret = instance_create(xx, yy, o_transmision);
    ret.nombre_destino = argument0.retorno;
    s_limite_mundo(ret);
    argument0.blancox = ret.x;
    argument0.blancoy = ret.y; }
return ret;

