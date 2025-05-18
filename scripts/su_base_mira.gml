// arg0: id quien llama y busca un edificio cercano
// arg1: true todos, false solo mejorables
// ret: id de la base o noone

var res = noone;
var dis = room_width;
var tmp;
with o_bloque {
    if estado != ms_muerto and tipo != mi_arbol and tipo != mi_piedra {
        tmp = point_distance(x, y, argument0.x, argument0.y);
        if tmp < dis and (argument1 or planeacion != 0) {
            dis = tmp;
            res = id; } } }
return res;

