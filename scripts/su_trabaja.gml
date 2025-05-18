// arg0: id quien llama, ganara monedas en cultivos

var limit = mu_saldo_porc * m_dolar;
if string_count("T", argument0.item) != 0 {
    limit *= 2.5; }
if argument0.saldo < limit {
    var mib = false;
    with o_bloque {
        if estado != ms_muerto and (tipo == mi_pozo or
                tipo == mi_molino) {
            if point_distance(x, y, argument0.x, argument0.y) <= mu_vision {
                mib = true;
                break; } } }
    if mib {
        var ggg = argument0.saldo;
        argument0.saldo = min(argument0.saldo + limit * 0.333, limit);
        if ggg != argument0.saldo and random(1) < m_soniazar * 0.5 {
            audio_play_sound(a_saldo, 8, false); } } }

