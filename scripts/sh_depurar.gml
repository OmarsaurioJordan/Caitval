// arg0: str int tipo de mensaje
// arg1: str nombre emisor
// arg2: str int cantidad
// arg3: str int limitepro
// arg4: str int dinero
// arg5: str texto

if argument0 == "95" { // listado de jugadores
    s_actualizar_contactos(argument5); }

else if argument0 == "100" { // jugador muerto
    if !audio_is_playing(av_mensaje) {
        s_audio_envios(mv_carta); }
    s_agregarcarta(si_suavatar(argument1, -1), argument1, mv_semurio,
        real(argument2), sd_discurso(21));
    var dir = random(360);
    var aux = instance_create(o_control.x + lengthdir_x(room_width, dir),
        o_control.y + lengthdir_y(room_width, dir), o_mosco);
    s_limite_mundo(aux);
    if argument2 == "1" {
        su_unidad(aux.x, aux.y, argument1, mt_cartero, "", 0, 0, 0, 30); }
    else {
        var ddd = real(argument4);
        repeat real(argument2) {
            if clamp(ddd, 0, m_dolar) != 0 {
                su_unidad(aux.x, aux.y, argument1, mt_regalo, "", 0, 0, clamp(ddd, 0, m_dolar), 0); 
                ddd -= m_dolar; } } }
    with aux {
        instance_destroy(); } }

else if real(argument0) <= 90 { // mensajes de juego
    // crear recepcion retardada
    var dir = random(360);
    var aux = instance_create(o_control.x + lengthdir_x(room_width, dir),
        o_control.y + lengthdir_y(room_width, dir), o_recepcion);
    s_limite_mundo(aux);
    // ajustar valores
    aux.tipo = real(argument0);
    aux.emisor = argument1;
    aux.cantidad = real(argument2);
    aux.limitepro = real(argument3);
    aux.dinero = real(argument4);
    aux.texto = argument5; }

