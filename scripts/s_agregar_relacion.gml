// arg0: nombre del emisor
// arg1: suma a la influencia
// arg2: suma a recep bien
// arg3: suma a recep totales

with o_control {
if is_array(relaciones) {
    var esta = false;
    for (var i = 0; i < array_height_2d(relaciones); i++) {
        if relaciones[i, 0] == argument0 {
            relaciones[i, 1] += argument1;
            relaciones[i, 2] += argument2;
            relaciones[i, 3] += argument3;
            esta = true;
            break; } }
    if !esta {
        var n = array_height_2d(relaciones);
        relaciones[n, 0] = argument0;
        relaciones[n, 1] = argument1;
        relaciones[n, 2] = argument2;
        relaciones[n, 3] = argument3; } }
else {
    relaciones[0, 0] = argument0;
    relaciones[0, 1] = argument1;
    relaciones[0, 2] = argument2;
    relaciones[0, 3] = argument3; } }

