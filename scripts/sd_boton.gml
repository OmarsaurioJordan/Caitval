// arg0, arg1: posicion x,y
// arg2: nombre del sprite
// arg3: subimagen del sprite
// arg4: verdadero si esta sobre el boton
// arg5: escalamiento del boton

if argument4 {
    draw_sprite_ext(argument2, argument3, argument0, argument1,
    argument5 + 0.3, argument5 + 0.3, 0, c_white, 1); }
else {
    draw_sprite_ext(argument2, argument3, argument0, argument1,
    argument5, argument5, 0, c_white, 1); }

