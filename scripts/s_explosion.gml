// arg0: id de edificacion que fue explotada
// arg1, arg2: epicentro de la explosion

argument0.vida--;
if argument0.vida <= 0 {
    argument0.estado = ms_muerto;
    su_saledemolicion();
    audio_play_sound(a_demolision, 95, false);
    s_history("Construccion Destruida"); }
else {
    argument0.reloj_arregla = m_arreglar * m_seg; }

audio_play_sound(a_explosion, 95, false);
var xxx = instance_create(argument1, argument2, o_explosion);
xxx.humo = false;
var rdes = si_radio(mi_casa) * 1.5;

with o_unidad {
    if point_distance(x, y, argument1, argument2) < rdes {
        estado = me_muerto; } }

with o_decorado {
    if point_distance(x, y, argument1, argument2) < rdes {
        estado = ms_muerto; } }

with o_bloque {
    if point_distance(x, y, argument1, argument2) < rdes and tipo == mi_arbol {
        if !audio_is_playing(a_arbol) {
            audio_play_sound(a_arbol, 90, false); }
        estado = ms_muerto; } }

