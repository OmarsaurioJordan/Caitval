// calcula las variables dependientes del control

with o_control {
    // avaluo
    dinero_avaluo = si_avaluo();
    // gente
    gente_actual = si_poblacion();
    if gente_actual > gente_record {
        gente_record = gente_actual; }
    gente_soporte = si_soportepob();
    // edificaciones
    edificaciones_actual = si_edificaciones(true);
    if gente_actual > edificaciones_record {
        edificaciones_record = edificaciones_actual; }
    edificaciones_pro = si_edificaciones(false);
    
    // deduda
    if dinero_avaluo != 0 {
        dinero_riesgo = dinero_deuda / dinero_avaluo; }
    else {
        dinero_riesgo = 0; }
    // avance
    if edificaciones_actual != 0 {
        edificaciones_avance = edificaciones_pro / edificaciones_actual; }
    else {
        edificaciones_avance = 0; }
    // envios
    if envios_totales != 0 {
        envios_son = envios_bien / envios_totales; }
    else {
        envios_son = 0.5; }
    // recepciones
    if recepciones_totales != 0 {
        recepciones_son = recepciones_bien / recepciones_totales; }
    else {
        recepciones_son = 0.5; } }

