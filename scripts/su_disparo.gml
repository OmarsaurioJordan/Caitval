// dispara proyectil
// arg0: id quien llama

if argument0.estado == me_guarecido and irandom(1) < 0.5 {
    var blanco;
    if o_control.espro != 0 {
        blanco = su_blanco(argument0, mu_vision * 2, 0); }
    else {
        blanco = su_blanco(argument0, mu_vision, 0); }
    var torre = si_mibloque(argument0);
    if blanco != noone and torre != noone {
        if torre.tipo == mi_torre {
            var dd = point_direction(torre.x, torre.y,
                blanco.x, blanco.y);
            var aux = instance_create(
                torre.x + lengthdir_x(si_radio(mi_torre) + 6, dd),
                torre.y + lengthdir_y(si_radio(mi_torre) + 6, dd),
                o_proyectil);
            aux.direction = dd;
            audio_play_sound(a_dispara, 30, false); } } }

