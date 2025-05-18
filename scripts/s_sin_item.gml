// arg0, arg1: posicion x,y donde buscar
// arg2: string item que no debe tener
// ret: id de unidad hallada

var res = noone;
with o_unidad {
    if (tipo == mt_ciudadano or tipo == mt_turista) and
            estado != me_muerto and estado != me_retirada {
        if point_distance(argument0, argument1, x, y) <= mu_vision and
                string_count(argument2, item) == 0 {
            res = id;
            break; } } }
return res;

