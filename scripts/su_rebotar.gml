// ret: normal de colision, o -1 si no hubo
// arg0: id de quien llama, hara calculos de colision

var ret = -1;
with o_bloque {
    if estado != ms_muerto and ((tipo != mi_arbol and tipo != mi_piedra) or
            argument0.reloj_trepar < mu_trepar * m_seg * 0.5) {
        if point_distance(x, y, argument0.x, argument0.y) <
                mu_radio + si_radio(tipo) {
            ret = point_direction(x, y, argument0.x, argument0.y);
            break; } } }
if ret == -1 {
    with o_unidad {
        if estado != me_muerto and estado != me_guarecido and id != argument0 {
            if point_distance(x, y, argument0.x, argument0.y) < mu_radio * 2 {
                ret = point_direction(x, y, argument0.x, argument0.y);
                break; } } } }
return ret;

