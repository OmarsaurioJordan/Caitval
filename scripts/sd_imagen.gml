// arg0: quien llama para dibujar las obras de arte
// arg1: reescalamiento de las imagenes

with argument0 {
switch tipo {
    case mg_casa: draw_sprite_ext(db_casa, 0, ww * 0.75, hh * 0.75,
        argument1, argument1, 0, c_white, 1); break;
    case mg_edificio: draw_sprite_ext(db_edificio, 0, ww * 0.75, hh * 0.75,
        argument1, argument1, 0, c_white, 1); break;
    case mg_fuerte: draw_sprite_ext(db_fuerte, 0, ww * 0.75, hh * 0.75,
        argument1, argument1, 0, c_white, 1); break;
    case mg_torre: draw_sprite_ext(db_torre, 0, ww * 0.75, hh * 0.75,
        argument1, argument1, 0, c_white, 1); break;
    case mg_templo: draw_sprite_ext(db_templo, 0, ww * 0.75, hh * 0.75,
        argument1, argument1, 0, c_white, 1); break;
    case mg_pozo: draw_sprite_ext(db_pozo, 0, ww * 0.75, hh * 0.75,
        argument1, argument1, 0, c_white, 1); break;
    case mg_molino:
        var paso = ceil(reloj_anima / (0.125 * mq_anima_molino * m_seg));
        draw_sprite_ext(db_molino, paso, ww * 0.75, hh * 0.75,
            argument1, argument1, 0, c_white, 1); break;
    case mg_planetario:
        var paso = ceil(reloj_anima / (0.0625 * mq_anima_planetario * m_seg));
        draw_sprite_ext(db_planetario, paso, ww * 0.75, hh * 0.75,
            argument1, argument1, 0, c_white, 1); break;
    case mg_unidad:
        var paso = 0;
        var ff = ceil(reloj_anima / (0.25 * mu_anima * m_seg * 1.5));
        if ff == 2 { paso = 1; } else if ff == 4 { paso = 2; }
        draw_sprite_ext(db_unidad, paso, ww * 0.75, hh * 0.75,
            m_siz * argument1, m_siz * argument1, 0, c_white, 1); break; } }

