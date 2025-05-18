// retorna del juego al menu, con lo que ello conlleva

s_savegame();
s_history("Sale de la partida");

with o_unidad { instance_destroy(); }
with o_bloque { instance_destroy(); }
with o_decorado { instance_destroy(); }
with o_transmision { instance_destroy(); }
with o_recepcion { instance_destroy(); }
with o_mosco { instance_destroy(); }
with o_proyectil { instance_destroy(); }
with o_explosion { instance_destroy(); }
with o_pichirilo { instance_destroy(); }

with o_control {
    nombre_jugador = "";
    avatar = irandom(m_avatares - 1); }

instance_create(0, 0, o_menu);
background_visible[2] = true;

with o_turno { instance_destroy(); }
with o_construir { instance_destroy(); }
with o_redactar { instance_destroy(); }

s_set_sonido();

