// arg0: id quien llama y busca una base disponible
// ret: id de la base o noone

var res = noone;
var dis = mu_vision;
var uni, tmp, my;
with o_bloque {
    if estado != ms_muerto and (tipo == mi_casa or tipo == mi_edificio or
            tipo == mi_fuerte or tipo == mi_torre) {
        tmp = point_distance(x, y, argument0.x, argument0.y);
        if tmp < dis {
            uni = 0;
            my = id;
            with o_unidad {
                if estado == me_guarecido and x == my.x and y == my.y {
                    uni++; } }
            if tipo == mi_casa and uni < 2 {
                dis = tmp;
                res = id; }
            else if tipo == mi_edificio and uni < 4 {
                dis = tmp;
                res = id; }
            else if (tipo == mi_fuerte or tipo == mi_torre) and uni < 3 {
                dis = tmp;
                res = id; } } } }
return res;

