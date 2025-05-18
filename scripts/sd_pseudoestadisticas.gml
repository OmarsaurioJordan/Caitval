// arg0, arg1: posicion x,y
// arg2: indice avatar
// arg3: est. tiempos
// arg4: est. poblacion
// arg5: est. dinero
// arg6: est. edificaciones
// arg7: est. mensajes

// avatar
draw_sprite_ext(d_avatar, argument2, argument0 + 100, argument1 + 150,
    0.75, 0.75, 0, c_white, 1);
sd_set_texto(fa_left, fa_middle, d_letras_estilizadas);
// estadisticas
draw_sprite_ext(d_estadisticas, 4, argument0 + 250, argument1 + 100,
    0.5, 0.5, 0, c_white, 1);
sd_texto(argument0 + 310, argument1 + 100, 0.8, argument3);
draw_sprite_ext(d_estadisticas, 0, argument0 + 250, argument1 + 170,
    0.5, 0.5, 0, c_white, 1);
sd_texto(argument0 + 310, argument1 + 170, 0.8, argument4);
draw_sprite_ext(d_estadisticas, 1, argument0 + 250, argument1 + 220,
    0.5, 0.5, 0, c_white, 1);
sd_texto(argument0 + 310, argument1 + 220, 0.8, argument5);
draw_sprite_ext(d_estadisticas, 2, argument0 + 500, argument1 + 170,
    0.5, 0.5, 0, c_white, 1);
sd_texto(argument0 + 560, argument1 + 170, 0.8, argument6);
draw_sprite_ext(d_estadisticas, 3, argument0 + 500, argument1 + 220,
    0.5, 0.5, 0, c_white, 1);

var dat = s_split(string_replace_all(string_replace_all(argument7, " ", ""), "%", ""), '/', true);
if is_array(dat) {
    draw_sprite_ext(d_envios, si_icono_relacion(real(dat[0])),
        argument0 + 600, argument1 + 220, 0.666, 0.666, 0, c_white, 1);
    draw_sprite_ext(d_envios, si_icono_relacion(real(dat[0])),
        argument0 + 670, argument1 + 220, 0.666, 0.666, 0, c_white, 1); }

