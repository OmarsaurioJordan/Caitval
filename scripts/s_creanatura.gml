// arg0: id quien llama y verifica si puede crearse ahi
// ret: 1 si se pudo crear, 0 si se destruyo

var res = 1;
var dif = 2.5;
var xx, yy, rad;
// si es bloque (arbol o piedra)
if argument0.object_index == o_bloque {
    // verificar colision con otros bloques
    with o_bloque {
        rad = max(si_radio(argument0.tipo), si_radio(tipo)) * dif;
        if id != argument0 and point_distance(x, y, argument0.x, argument0.y) < rad {
            res = 0;
            break; } }
    // verificar colision con decorados
    with o_decorado {
        if tipo == mf_agua {
            rad = max(m_tensagua, si_radio(argument0.tipo) * dif);
            if point_distance(x, y, argument0.x, argument0.y) < rad {
                res = 0;
                break; } }
        else {
            rad = si_radio(argument0.tipo) * dif;
            if point_distance(x, y, argument0.x, argument0.y) < rad {
                estado = ms_muerto; } } } }
// si es decorado
else {
   // verificar colision con bloques
    with o_bloque {
        if argument0.tipo == mf_agua {
            rad = max(m_tensagua, si_radio(tipo) * dif); }
        else {
            rad = si_radio(tipo) * dif; }
        if point_distance(x, y, argument0.x, argument0.y) < rad {
            res = 0;
            break; } }
    // verificar colision con otros decorados
    with o_decorado {
        if argument0.tipo == mf_agua {
            rad = m_tensagua; }
        else {
            rad = si_radio(mi_arbol) * dif; }
        if id != argument0 and point_distance(x, y, argument0.x, argument0.y) < rad {
            res = 0;
            break; } } }
// verificar si fuera del mundo 
xx = argument0.x;
yy = argument0.y;
s_limite_mundo(argument0);
if xx != argument0.x or yy != argument0.y {
    res = 0; }
// eliminar si asi se predijo
if res == 0 {
    with argument0 {
        instance_destroy(); } }
return res;

