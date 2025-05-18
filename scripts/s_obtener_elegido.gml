// arg0: sombreado en la GUI
// ret: devuelve al jugador seleccionado

var aux = -1;
if is_array(o_control.contactos) {
    aux = array_height_2d(o_control.contactos) - 1;
    if argument0 >= mm_envio_quien and argument0 < mm_mm {
        aux = argument0 - mm_envio_quien; }
    else {
        for (var i = 0; i < array_height_2d(o_control.contactos); i++) {
            if o_control.contactos[i, 3] {
                aux = i;
                break; } } }
    aux = clamp(aux, 0, array_height_2d(o_control.contactos) - 1); }
return aux;

