// ret: id de unidad a ser convencido de unirse
// arg0: id quien llama
// arg1: distancia base para hallar al objetivo
// arg2: distancia extra para hallarlo, total=arg1+arg2

var res = noone;
var candidatos;
var i = 0;
var solemne;
with o_unidad {
    solemne = (tipo == mt_ciudadano or tipo == mt_turista) and estado == me_retirada;
    if estado != me_muerto and !solemne and estado != me_guarecido and
            retorno != argument0.retorno and tipo != argument0.tipo {
        if point_distance(x, y, argument0.x, argument0.y) <= argument1 + argument2 {
            if si_suceptible(argument0.tipo, tipo) {
                candidatos[i] = id;
                i++; } } } }
if i > 0 {
    res = candidatos[irandom(i - 1)]; }
else if si_afectaguarecidos(argument0.tipo) {
    with o_unidad {
        if estado == me_guarecido and retorno != argument0.retorno {
            var mib = si_mibloque(id);
            if mib != noone {
                if point_distance(x, y, argument0.x, argument0.y) <=
                        si_radio(mib.tipo) + argument2 {
                    if si_suceptible(argument0.tipo, tipo) {
                        candidatos[i] = id;
                        i++; } } } } }
    if i > 0 {
        res = candidatos[irandom(i - 1)]; } }
return res;

