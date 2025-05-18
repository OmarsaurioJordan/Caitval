// arg0: dentro de cuantos minutos se considera obsoleto el mensaje

if is_array(o_control.miscartas) {
    var minutos = 1000;
    if array_height_2d(o_control.miscartas) > m_len_lista {
        minutos = argument0; }
    var nuevo = noone;
    var n;
    for (var i = 0; i < array_height_2d(o_control.miscartas); i++) {
        if date_compare_datetime(date_inc_minute(o_control.miscartas[i, 5], minutos),
                date_current_datetime()) > 0 {
            if is_array(nuevo) {
                n = array_height_2d(nuevo); }
            else {
                n = 0; }
            for (var j = 0; j < 7; j++) {
                nuevo[n, j] = o_control.miscartas[i, j]; } } }
    o_control.desf_mnsj = clamp(o_control.desf_mnsj, 0, array_height_2d(nuevo) - 1);
    o_control.miscartas = nuevo; }

