// arg0, arg1: posiciones x,y
// arg2: string item a darle si hay cupo
// arg3: id de tipo de envio representativo
// ret: id a quien se le dio item, noone si ninguno

var aux = noone;
var num_pros = 0;
with o_unidad {
    if estado != me_muerto and (tipo == mt_ciudadano or
            tipo == mt_turista) and string_count(argument2, item) != 0 {
        num_pros++; } }
if num_pros < si_limitepro(argument3, false) {
    aux = s_sin_item(argument0, argument1, argument2);
    if aux != noone {
        aux.item += argument2; } }
return aux;

