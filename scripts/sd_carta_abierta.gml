// arg0, arg1: posicion x,y
// arg2: avatar, -1 para mensaje espia
// arg3: nombre para titulo de la carta
// arg4: tipo de envio
// arg5: valor adjunto al envio
// arg6: texto del mensaje
// arg7: datetime del mensaje

draw_sprite_ext(d_carta, 0, argument0, argument1, 1.666, 1.666, 0, c_white, 1);
draw_sprite_ext(d_carta, 2, argument0, argument1, 1.666, 1.666, 0, c_white, 1);

sd_set_texto(fa_center, fa_middle, d_letras_estilizadas);
if argument2 != -1 {
    sd_texto(argument0 + 190, argument1 - 29, 1, argument3);
    sd_texto(argument0 + 362, argument1 + 45, 1.5, string(argument5));
    draw_sprite_ext(d_avatar, argument2, argument0 + 74,
        argument1 + 91, 0.5, 0.5, 0, c_white, 1);
    if argument4 == mv_semurio {
        draw_sprite_ext(d_envios, 0, argument0 + 232,
            argument1 + 53, 1, 1, 0, c_white, 1); }
    else {
        draw_sprite_ext(d_envios, argument4, argument0 + 232,
            argument1 + 53, 1, 1, 0, c_white, 1); } }
else {
    sd_texto(argument0 + 190, argument1 - 29, 1, sd_discurso(5));
    draw_sprite_ext(d_envios, 1, argument0 + 74,
        argument1 + 91, 2, 2, 0, c_white, 1); }

sd_set_texto(fa_left, fa_top, d_letras_estilizadas);
if argument6 == "" {
    draw_text_ext_transformed_colour(argument0 - 30, argument1 + 197, "...", 50, 600,
        0.8, 0.8, 3, c_black, c_black, c_black, c_black, 1); }
else {
    draw_text_ext_transformed_colour(argument0 - 30, argument1 + 197, argument6, 50, 600,
        0.8, 0.8, 3, c_black, c_black, c_black, c_black, 1); }

sd_set_texto(fa_center, fa_middle, d_letras_estilizadas);
draw_text_transformed_colour(argument0 + 500, argument1 + 751,
    date_datetime_string(argument7), 0.8, 0.8, 40,
    c_black, c_black, c_black, c_black, 1);

