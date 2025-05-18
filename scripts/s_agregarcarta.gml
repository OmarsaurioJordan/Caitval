// arg0: avatar, -1 para mensaje de espias
// arg1: nombre de jugador, vacio para mensaje de espias
// arg2: tipo de envio
// arg3: valor adjunto al envio
// arg4: texto del mensaje

var i = 0;
if is_array(o_control.miscartas) {
    i = array_height_2d(o_control.miscartas); }
if o_control.desf_mnsj == i - 1 {
    o_control.desf_mnsj = i; }
o_control.miscartas[i, 0] = argument0;
o_control.miscartas[i, 1] = argument1;
o_control.miscartas[i, 2] = argument2;
o_control.miscartas[i, 3] = argument3;
o_control.miscartas[i, 4] = argument4;
o_control.miscartas[i, 5] = date_current_datetime();
o_control.miscartas[i, 6] = false;

