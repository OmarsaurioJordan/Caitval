// ret: verdadero si hallo a alguien
// arg0: id quien llama y buscara blanco a persuadir

var ret = false;
if si_persuadidor(argument0.tipo) and random(1) < m_probact {
    var cercania = mu_vision;
    var quien = noone;
    var tmp, solemne;
    with o_unidad {
        solemne = (tipo == mt_ciudadano or tipo == mt_turista) and estado == me_retirada;
        if estado != me_muerto and estado != me_guarecido and !solemne and
                retorno != argument0.retorno {
            tmp = point_distance(x, y, argument0.x, argument0.y);
            if tmp <= cercania {
                if si_suceptible(argument0.tipo, tipo) {
                    cercania = tmp;
                    quien = id; } } } }
    if quien != noone {
        if (argument0.tipo == mt_ciudadano or argument0.tipo == mt_turista) and
                argument0.intentos == 0 {
            var mib = su_base_cerca(argument0);
            if mib != noone {
                var dd = point_direction(mib.x, mib.y, argument0.x, argument0.y);
                argument0.blancox = mib.x + lengthdir_x(si_radio(mib.tipo), dd);
                argument0.blancoy = mib.y + lengthdir_y(si_radio(mib.tipo), dd); }
            else {
                var dd = point_direction(quien.x, quien.y, argument0.x, argument0.y);
                argument0.blancox = argument0.x + lengthdir_x(mu_vision * 0.5, dd);
                argument0.blancoy = argument0.y + lengthdir_y(mu_vision * 0.5, dd);
                su_prevenir_blanco_feo(argument0); } }
        else {
            argument0.blancox = quien.x;
            argument0.blancoy = quien.y; }
        argument0.estado = me_objetivo;
        ret = true; }
    else if si_afectaguarecidos(argument0.tipo) {
        with o_unidad {
            if estado == me_guarecido and retorno != argument0.retorno {
                tmp = point_distance(x, y, argument0.x, argument0.y);
                if tmp <= cercania {
                    if si_suceptible(argument0.tipo, tipo) {
                        cercania = tmp;
                        quien = id; } } } }
        if quien != noone {
            var mib = si_mibloque(quien);
            if mib != noone {
                argument0.estado = me_objetivo;
                var dd = point_direction(mib.x, mib.y, argument0.x, argument0.y);
                argument0.blancox = mib.x + lengthdir_x(si_radio(mib.tipo), dd);
                argument0.blancoy = mib.y + lengthdir_y(si_radio(mib.tipo), dd);
                ret = true; } } } }
return ret;

