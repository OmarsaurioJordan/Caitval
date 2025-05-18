// arg0: id unidad que morira

if argument0.estado == me_guarecido {
    su_liberabloque(argument0);
    var mib = si_mibloque(argument0);
    if mib != noone {
        var aux = si_radio(mib.tipo) + mu_radio;
        var dd = random(360);
        argument0.x += lengthdir_x(aux, dd);
        argument0.y += lengthdir_y(aux, dd); } }
argument0.estado = me_muerto;

// sonido muerte
if argument0.tipo == mt_salvaje or argument0.tipo == mt_gigante or
        argument0.tipo == mt_titan {
    audio_play_sound(a_caemonstruo, 50, false); }
else {
    audio_play_sound(a_muere, 50, false); }

// dejar dinero o saldo a cercano
if (argument0.tipo == mt_ladron or argument0.tipo == mt_regalo) and argument0.saldo > 0 {
    with o_unidad {
        if (estado == me_objetivo or estado == me_andar) and
                (tipo == mt_ciudadano or tipo == mt_turista) {
            if point_distance(x, y, argument0.x, argument0.y) <= mu_radio * 3 {
                item = "";
                saldo = argument0.saldo;
                argument0.saldo = 0;
                tipo = mt_regalo;
                break; } } } }

