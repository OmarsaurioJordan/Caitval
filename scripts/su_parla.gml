// arg0: id objetivo a convencer
// arg1: cantidad de influencia
// arg2: retorno, nombre de partida a unirse

var defensa = 1;
if string_count("G", argument0.item) != 0 {
    defensa = 0.5; } // intelectual
if argument0.estado == me_guarecido {
    var mib = si_mibloque(argument0);
    if mib != noone {
        if mib.tipo == mi_casa or mib.tipo == mi_edificio {
            defensa *= 0.6; } // en vivienda
        else {
            defensa *= 0.8; } } } // en fortificacion
if argument0.tipo == mt_sabio {
    defensa *= 0.75; } // es un convencedor extranjero
if random(1) < argument1 * defensa {
    if random(1) < m_soniazar {
        audio_play_sound(a_convencido, 22, false); }
    argument0.retorno = argument2;
    argument0.item = "";
    argument0.saldo = 0;
    argument0.reloj_mision = 0;
    su_liberabloque(argument0);
    switch argument0.tipo {
        case mt_ciudadano:
        case mt_turista:
            argument0.estado = me_retirada;
            argument0.tipo = mt_fugado;
            break;
        case mt_fugado:
        case mt_sabio:
            argument0.estado = me_andar;
            if argument0.propietario == o_control.nombre_jugador {
                argument0.tipo = mt_ciudadano; }
            else {
                argument0.tipo = mt_turista; }
            break; } }
else if random(1) < m_soniazar {
    audio_play_sound(a_persuade, 21, false); }

