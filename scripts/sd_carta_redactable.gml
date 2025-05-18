// arg0, arg1: posicion x,y
// arg2: avatar
// arg3: nombre para titulo de la carta
// arg4: tipo de envio
// arg5: valor adjunto al envio
// arg6: texto del mensaje
// arg7: verdadero si esta sombreado el numero de valor de envio

draw_sprite_ext(d_carta, 0, argument0, argument1, 1.666, 1.666, 0, c_white, 1);
draw_sprite_ext(d_carta, 1, argument0, argument1, 1.666, 1.666, 0, c_white, 1);

sd_set_texto(fa_center, fa_middle, d_letras_estilizadas);
sd_texto(argument0 + 190, argument1 - 29, 1, argument3);
if argument7 {
    sd_texto(argument0 + 362, argument1 + 45, 2.7, string(argument5)); }
else {
    sd_texto(argument0 + 362, argument1 + 45, 1.5, string(argument5)); }
draw_sprite_ext(d_avatar, argument2, argument0 + 74,
    argument1 + 91, 0.5, 0.5, 0, c_white, 1);
draw_sprite_ext(d_envios, argument4, argument0 + 232,
    argument1 + 53, 1, 1, 0, c_white, 1);

sd_set_texto(fa_left, fa_top, d_letras_estilizadas);
draw_text_ext_transformed_colour(argument0 - 30, argument1 + 197, argument6, 50, 600,
    0.8, 0.8, 3, c_black, c_black, c_black, c_black, 1);

