// arg0: cantidad de dinero a agregar a la deuda
// arg1: nombre de jugador responsable

o_control.dinero_deuda += argument0;

if is_array(o_control.prestamistas) {
    var esta = false;
    for (var i = 0; i < array_height_2d(o_control.prestamistas); i++) {
        if o_control.prestamistas[i, 0] == argument1 {
            o_control.prestamistas[i, 1] += argument0;
            esta = true;
            break; } }
    if !esta {
        var ac = array_height_2d(o_control.prestamistas);
        o_control.prestamistas[ac, 0] = argument1;
        o_control.prestamistas[ac, 1] = argument0; } }
else {
    o_control.prestamistas[0, 0] = argument1;
    o_control.prestamistas[0, 1] = argument0; }

