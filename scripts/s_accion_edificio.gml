// arg0: tipo de edificacion que actua
// arg1, arg2: posicion x, y del evento

switch argument0 {
    case mi_pozo:
    case mi_molino:
        var aux = s_darlepoder(argument1, argument2, "T", mv_venta);
        if aux != noone and random(1) < m_soniazar * 0.25 {
            audio_play_sound(a_nuevo_t, 33, false); }
        break;
    case mi_templo:
    case mi_planetario:
        var aux = s_darlepoder(argument1, argument2, "G", mv_persuacion);
        if aux != noone {
            if random(1) < m_soniazar * 0.25 {
                audio_play_sound(a_nuevo_g, 33, false); }
            aux.intentos = mu_intentos; }
        else {
            aux = s_sin_item(argument1, argument2, "X");
            if aux != noone {
                aux.intentos = min(aux.intentos + 1, mu_intentos); } }
        break;
    case mi_fuerte:
    case mi_torre:
        var aux = s_darlepoder(argument1, argument2, "E", mv_defensa);
        if aux != noone and random(1) < m_soniazar * 0.25 {
            audio_play_sound(a_nuevo_e, 33, false); }
        break; }

