// arg0: cantidad de dinero a disminuir a la deuda

o_control.dinero_deuda = max(0, o_control.dinero_deuda - argument0 * m_dinero_interes);

var reparto, actualizacion, ac;
var monto = argument0 * m_dinero_interes;
while is_array(o_control.prestamistas) and monto > 0 {
    actualizacion = noone;
    reparto = monto / array_height_2d(o_control.prestamistas);
    for (var i = 0; i < array_height_2d(o_control.prestamistas); i++) {
        o_control.prestamistas[i, 1] -= reparto;
        if o_control.prestamistas[i, 1] < 0 {
            monto -= reparto + o_control.prestamistas[i, 1]; }
        else {
            monto -= reparto;
            if is_array(actualizacion) {
                ac = array_height_2d(actualizacion);
                actualizacion[ac, 0] = o_control.prestamistas[i, 0];
                actualizacion[ac, 1] = o_control.prestamistas[i, 1]; }
            else
                actualizacion[0, 0] = o_control.prestamistas[i, 0];
                actualizacion[0, 1] = o_control.prestamistas[i, 1]; } }
    o_control.prestamistas = actualizacion; }

