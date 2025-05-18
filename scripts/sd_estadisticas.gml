// arg0, arg1: posicion x,y
// arg2: indice avatar
// arg3: nombre del jugador
// arg4: est. tiempos
// arg5: est. poblacion
// arg6: est. dinero
// arg7: est. edificaciones
// arg8: est. mensajes

// marco y avatar
sd_cuadro(argument0, argument1, 8, 3, 1, 1);
draw_sprite_ext(d_avatar, argument2, argument0 + 130, argument1 + 150,
    0.5, 0.5, 0, c_white, 1);
sd_set_texto(fa_left, fa_middle, d_letras_estilizadas);
// nombre
sd_texto(argument0 + 250, argument1 + 100, 1, argument3);
// estadisticas
draw_sprite_ext(d_estadisticas, 4, argument0 + 625, argument1 + 100,
    0.5, 0.5, 0, c_white, 1);
sd_texto(argument0 + 685, argument1 + 100, 1, argument4);
draw_sprite_ext(d_estadisticas, 0, argument0 + 250, argument1 + 170,
    0.5, 0.5, 0, c_white, 1);
sd_texto(argument0 + 310, argument1 + 170, 0.8, argument5);
draw_sprite_ext(d_estadisticas, 1, argument0 + 250, argument1 + 220,
    0.5, 0.5, 0, c_white, 1);
sd_texto(argument0 + 310, argument1 + 220, 0.8, argument6);
draw_sprite_ext(d_estadisticas, 2, argument0 + 500, argument1 + 170,
    0.5, 0.5, 0, c_white, 1);
sd_texto(argument0 + 560, argument1 + 170, 0.8, argument7);
draw_sprite_ext(d_estadisticas, 3, argument0 + 500, argument1 + 220,
    0.5, 0.5, 0, c_white, 1);

var dat = s_split(string_replace_all(string_replace_all(argument8, " ", ""), "%", ""), '/', true);
if is_array(dat) {
    draw_sprite_ext(d_envios, si_icono_relacion(real(dat[0])),
        argument0 + 600, argument1 + 220, 0.666, 0.666, 0, c_white, 1);
    draw_sprite_ext(d_envios, si_icono_relacion(real(dat[0])),
        argument0 + 670, argument1 + 220, 0.666, 0.666, 0, c_white, 1); }

