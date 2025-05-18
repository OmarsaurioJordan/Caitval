// dibuja un cuadro en la pantalla
// arg0, arg1: posicion x,y
// arg2, arg3: dimension discretizada w,h
// arg4: reescalamiento
// arg5: transparencia

var lado = 100 * argument4;
// zona superiror
draw_sprite_ext(d_cuadro, 0, argument0, argument1,
    argument4, argument4, 0, c_white, argument5);
for (var w = 1; w < argument2 - 1; w++) {
    draw_sprite_ext(d_cuadro, 1, argument0 + lado * w, argument1,
        argument4, argument4, 0, c_white, argument5); }
draw_sprite_ext(d_cuadro, 0, argument0 + lado * argument2, argument1,
    -argument4, argument4, 0, c_white, argument5);
// zona central
for (var h = 1; h < argument3 - 1; h++) {
    draw_sprite_ext(d_cuadro, 2, argument0, argument1 + lado * h,
        argument4, argument4, 0, c_white, argument5);
    for (var w = 1; w < argument2 - 1; w++) {
        draw_sprite_ext(d_cuadro, 3, argument0 + lado * w, argument1 + lado * h,
            argument4, argument4, 0, c_white, argument5); }
    draw_sprite_ext(d_cuadro, 2, argument0 + lado * argument2, argument1 + lado * h,
        -argument4, argument4, 0, c_white, argument5); }
// zona inferiror
draw_sprite_ext(d_cuadro, 0, argument0, argument1 + lado * argument3,
    argument4, -argument4, 0, c_white, argument5);
for (var w = 1; w < argument2 - 1; w++) {
    draw_sprite_ext(d_cuadro, 1, argument0 + lado * w, argument1 + lado * argument3,
        argument4, -argument4, 0, c_white, argument5); }
draw_sprite_ext(d_cuadro, 0, argument0 + lado * argument2, argument1 + lado * argument3,
    -argument4, -argument4, 0, c_white, argument5);

