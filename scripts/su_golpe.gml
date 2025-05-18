// arg0: id objetivo a herir
// arg1: cantidad de damage hecho

var yes = false;
if argument0.tipo == mt_titan {
    if random(1) > 0.9 { yes = true; } } // titan
else if argument0.tipo == mt_gigante {
    if random(1) > 0.75 { yes = true; } } // gigante
else if argument0.estado == me_guarecido {
    var mib = si_mibloque(argument0);
    if mib != noone {
        if mib.tipo == mi_casa or mib.tipo == mi_edificio {
            if random(1) > 0.75 { yes = true; } } // en vivienda
        else {
            if random(1) > 0.9 { yes = true; } } } // en fortificacion
    else {
        if random(1) > 0.5 { yes = true; } } } // normal
else {
    if string_count("E", argument0.item) == 0 {
        if random(1) > 0.25 { yes = true; } } // con escudo
    else {
        if random(1) > 0.5 { yes = true; } } } // normal
if yes {
    argument0.reloj_golpe = mu_shock * m_seg;
    argument0.reloj_vida = mu_regenera * m_seg;
    argument0.vida = max(0, argument0.vida - argument1);
    if argument0.vida > 0 {
        if argument0.tipo == mt_salvaje or argument0.tipo == mt_gigante or
                argument0.tipo == mt_titan {
            s_audio_golpe(false); }
        else {
            s_audio_golpe(true); } } }

