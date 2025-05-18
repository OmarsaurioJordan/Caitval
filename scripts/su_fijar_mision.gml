// arg0: id quien llama y buscara que debe hacer

with argument0 {
if random(1) < m_probact * 0.5 {
switch tipo {
    case mt_vendedor:
    case mt_regalo:
    case mt_ladron:
        var aux = noone;
        var dis = room_width;
        var tmp;
        with o_bloque {
            if estado != ms_muerto and tipo != mi_arbol and tipo != mi_piedra {
                tmp = point_distance(o_control.x, o_control.y, x, y);
                if tmp < dis {
                    aux = id;
                    dis = tmp; } } }
        if aux != noone {
            var dd = point_direction(aux.x, aux.y, x, y);
            blancox = aux.x + lengthdir_x(si_radio(aux.tipo), dd);
            blancoy = aux.y + lengthdir_y(si_radio(aux.tipo), dd);
            estado = me_objetivo; }
        break;
    case mt_ingeniero:
        var aux = su_base_mira(argument0, false);
        if aux != noone {
            var dd = point_direction(aux.x, aux.y, x, y);
            blancox = aux.x + lengthdir_x(si_radio(aux.tipo), dd);
            blancoy = aux.y + lengthdir_y(si_radio(aux.tipo), dd);
            estado = me_objetivo; }
        break;
    case mt_asedio:
        var aux = su_base_mira(argument0, true);
        if aux != noone {
            var dd = point_direction(aux.x, aux.y, x, y);
            blancox = aux.x + lengthdir_x(si_radio(aux.tipo), dd);
            blancoy = aux.y + lengthdir_y(si_radio(aux.tipo), dd);
            estado = me_objetivo; }
        break;
    case mt_ciudadano:
    case mt_turista:
        if random(1) < mu_guardarse * (2 - actuar) {
            var aux = su_base_cerca(id);
            if aux != noone {
                var dd = point_direction(aux.x, aux.y, x, y);
                blancox = aux.x + lengthdir_x(si_radio(aux.tipo), dd);
                blancoy = aux.y + lengthdir_y(si_radio(aux.tipo), dd);
                actuar = 0;
                estado = me_objetivo; } }
        break; } } }

