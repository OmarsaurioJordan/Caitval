// pinta las estadisticas de la partida actual

with o_control {
sd_estadisticas(0, 0, avatar, nombre_jugador, string(ciclo_edad),
    string(gente_actual) + " / " + string(gente_soporte),
    string(floor(dinero_actual)) + " / -" + string(dinero_riesgo * 100) + "%",
    string(edificaciones_actual) + " / " + string(edificaciones_avance * 100) + "%",
    string(envios_son) + "% / " + string(recepciones_son) + "%"); }

