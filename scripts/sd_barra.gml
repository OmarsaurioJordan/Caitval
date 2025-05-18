// arg0, arg1: posiciones x,y
// arg2: numero de segmentos
// arg3: porcentaje cargado
// arg4: reescalamiento

var lado = 100 * argument4;
// fondo
draw_rectangle_colour(argument0, argument1 - 25 * argument4,
    argument0 + lado * (argument2 - 1), argument1 + 25 * argument4,
    c_gray, c_gray, c_gray, c_gray, false);
// barra de carga
draw_rectangle_colour(argument0, argument1 - 25 * argument4,
    argument0 + lado * (argument2 - 1) * (1 - argument3), argument1 + 25 * argument4,
    c_yellow, c_yellow, c_yellow, c_yellow, false);
// todo el marco
draw_sprite_ext(d_barra, 0, argument0, argument1,
    argument4, argument4, 0, c_white, 1);
for (var w = 1; w < argument2 - 1; w++) {
    draw_sprite_ext(d_barra, 1, argument0 + lado * w, argument1,
        argument4, argument4, 0, c_white, 1); }
draw_sprite_ext(d_barra, 0, argument0 + lado * (argument2 - 1), argument1,
    -argument4, argument4, 0, c_white, 1);

