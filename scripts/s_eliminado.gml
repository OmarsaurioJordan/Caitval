// arg0: string de tipo de eliminacion para el historial
// esto sucede cuando se ha perdido el juego

audio_play_sound(a_perdiste, 95, false);

with o_control {
    estavivo = false;
    sh_envio_http(98, "", nombre_jugador, 0, 0, 0, "");
    s_agregarcarta(-1, "", mv_informe, 1, sd_discurso(16));
    
    var yaenviado = noone;
    var ye = 0;
    if is_array(prestamistas) {
        var deu;
        for (var i = 0; i < array_height_2d(prestamistas); i++) {
            deu = max(1, ceil(prestamistas[i, 0]));
            yaenviado[ye] = prestamistas[i, 0];
            ye++;
            sh_envio_http(100, prestamistas[i, 0], nombre_jugador,
                max(1, ceil(deu / m_dolar)), 0, deu, ""); } }
    prestamistas = noone;
    
    if is_array(lascaritas) {
        var yap;
        for (var i = 0; i < array_height_2d(lascaritas); i++) {
            yap = false;
            if ye > 0 {
                for (var v = 0; v < ye; v++) {
                    if lascaritas[i, 1] == yaenviado[v] {
                        yap = true;
                        break; } } }
            if !yap {
                sh_envio_http(100, lascaritas[i, 1], nombre_jugador,
                    1, 0, 0, ""); } } } }

with o_unidad {
    if estado != me_muerto {
        estado = me_retirada; } }

with o_bloque {
    guarecidos = 0; }

with o_recepcion {
     if tipo > 1 and tipo < 90 and emisor != "" {
        sh_envio_http(0, emisor, "", cantidad, 0, dinero, ""); }
     instance_destroy(); }

with o_construir {
    instance_destroy(); }
with o_redactar {
    instance_destroy(); }
with o_turno {
    instance_destroy(); }
instance_create(0, 0, o_turno);

s_savegame();
s_history(argument0);

