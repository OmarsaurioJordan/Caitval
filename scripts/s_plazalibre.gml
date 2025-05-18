// arg0, arg1: posicion x,y a ver si se puede construir
// arg2: true si eliminar decorados para construir
// ret: true si se puede construir

var res = true;
var rad;
with o_bloque {
    if estado != ms_muerto {
        if argument2 {
            rad = si_radio(mi_molino) * 2 + mu_radio * 6; }
        else {
            rad = si_radio(mi_molino); }
        if point_distance(x, y, argument0, argument1) < rad {
            res = false;
            break; } } }
// eliminar decorados
if res and argument2 {
    with o_decorado {
        if estado != ms_muerto {
            if tipo == mf_agua {
                rad = max(m_tensagua, si_radio(mi_molino) * 2.5); }
            else {
                rad = si_radio(mi_molino) * 2.5; }
            if point_distance(x, y, argument0, argument1) < rad {
                estado = ms_muerto; } } } }
return res;

