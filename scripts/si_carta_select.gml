// arg0: sombreado actual
// ret: indice de carta abierta, o -1 si ninguna

var aux = -1;
if argument0 >= mm_mnsj_all and argument0 < mm_construir {
        aux = argument0 - mm_mnsj_all; }
    else {
        for (var i = 0; i < array_height_2d(o_control.miscartas); i++) {
            if o_control.miscartas[i, 6] {
                aux = i;
                break; } } }
if aux >= array_height_2d(o_control.miscartas) {
    aux = -1; }
return aux;

