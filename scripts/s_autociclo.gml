// cosas extras que suceden cada tanto

var aux, plus;
audio_play_sound(a_cicloautoaire, 5, false);

// verificar si hay conexion
if !os_is_network_connected() {
    s_menu();
    o_menu.loggg = sd_discurso(7);
    exit; }

// crecen arboles
plus = 1;
if current_hour >= 12 and current_hour <= 18 {
    plus = 2; }
if random(1) < mp_arbol * plus {
    aux = instance_create(random(room_width),
        random(room_height), o_bloque);
    aux.tipo = mi_arbol;
    if s_creanatura(aux) == 1 {
        audio_play_sound(a_arbol, 80, false); } }

// crecen decorados
plus = 1;
if current_hour >= 6 and current_hour <= 12 {
    plus = 2; }
if random(1) < mp_decorado * plus {
    aux = instance_create(random(room_width),
        random(room_height), o_decorado);
    aux.tipo = choose(mf_arbusto, mf_arbusto, mf_arbusto, mf_florez);
    s_creanatura(aux); }

// llegan monstruos naturales
plus = 1;
if current_hour >= 18 {
    plus = 2; }
else if current_hour <= 6 {
    plus = 3; }
if random(1) < mp_monsters * plus and o_control.edificaciones_actual >= 6 and
        o_control.estavivo and o_control.gente_actual >= 18 {
    var prop = o_control.gente_actual / mu_muchos;
    // salvajes
    var normales = clamp(irandom_range(-m_max_monsters + prop, prop * 2), 1, m_max_monsters);
    // gigantes
    plus = 0.333;
    if current_weekday >= 5 or current_weekday == 0 {
        plus = 0.666; }
    var gigantes = clamp(irandom_range(-m_max_monsters + prop * plus, prop), 0, ceil(m_max_monsters * 0.333));
    // titanes
    plus = 0.1;
    if current_weekday == 6 {
        plus = 0.5; }
    var titanes = clamp(irandom_range(-m_max_monsters + o_control.edificaciones_actual * plus,
        (o_control.edificaciones_actual + o_control.edificaciones_pro) * 0.5), 0, 1);
    sh_depurar(90, "", normales, gigantes, titanes, ""); }

// sucede una inmigracion masiva
plus = 1;
if current_weekday >= 1 {
    plus = 3; }
if random(1) < mp_monsters * plus and o_control.edificaciones_actual >= 5 and
        o_control.estavivo and o_control.gente_actual >= 20 {
    var porc = ceil(o_control.gente_actual * random_range(0.25, 0.5));
    var num = 0;
    audio_play_sound(a_mevoy, 50, false);
    with o_unidad {
        if estado != me_muerto and (tipo == mt_ciudadano or
                tipo == mt_turista) and estado != me_retirada {
            su_liberabloque(id);
            tipo = mt_fugado;
            item = "";
            saldo = 0;
            estado = me_retirada;
            num++;
            if num >= porc {
                break; } } } }

