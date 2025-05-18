// pondra arboles, rocas, decorados y unidades iniciales en el mapa

// crear primera casa al centro del mapa
instance_create(o_control.x, o_control.y, o_bloque);
audio_play_sound(a_nuevomapa, 95, false);

// crear primeros ciudadanos
var ciu_ini = 4;
repeat ciu_ini {
    instance_create(o_control.x - 10 + random(20),
        o_control.y - 10 + random(20), o_unidad); }

// asegurarse control inicia variables nuevas
with o_control {
    dinero_actual = m_dolar * 6;
    dinero_deuda = 0;
    dinero_avaluo = si_requisitos(mj_casa, 0, false);
    prestamistas = noone;
    contactos = noone;
    relaciones = noone;
    miscartas = noone;
    estavivo = true;
    ciclo_edad = 1;
    tiempo_edad = 0;
    gente_actual = ciu_ini;
    gente_soporte = si_soportepob();
    gente_record = ciu_ini;
    edificaciones_actual = 1;
    edificaciones_pro = 0;
    edificaciones_record = 1;
    envios_bien = 0;
    envios_totales = 0;
    recepciones_bien = 0;
    recepciones_totales = 0;
    reloj_atencion = 0;
    reloj_edad = 0;
    reloj_cuentas = 0;
    reloj_influencia = 0; }

randomize();
var aux, xx, yy;

// crear rios
var cauce;
repeat choose(1, 1, 1, 1, 2, 2, 2, 3, 3, 4) { // numero de rios
    xx = o_control.x - o_control.c_mundo + random(o_control.c_mundo * 2);
    yy = o_control.y - o_control.c_mundo + random(o_control.c_mundo * 2);
    cauce = point_direction(o_control.x, o_control.y, xx, yy) - 30 + random(60);
    repeat 10 + irandom(20) { // longitud del rio
        aux = instance_create(xx, yy, o_decorado);
        aux.tipo = mf_agua;
        if s_creanatura(aux) == 0 {
            break; }
        else {
            if random(1) < 0.75 {
                cauce += -20 + random(40); }
            else {
                cauce += clamp((-40 + random(80)) * 3, -40, 40); }
            xx += lengthdir_x(m_tensagua + 1, cauce);
            yy += lengthdir_y(m_tensagua + 1, cauce); } } }

// crear bloques naturales, arboles y piedras
var total = 20 + irandom(20);
var freno = 0;
do {
    aux = instance_create(random(room_width),
        random(room_height), o_bloque);
    if random(1) < 0.8 {
        aux.tipo = mi_arbol; }
    else {
        aux.tipo = mi_piedra; }
    aux.reloj_accion = random(m_accionedif * m_seg);
    total -= s_creanatura(aux);
    freno++; }
until (freno > 1000 or total <= 0);

// crear calzadas
var dis;
repeat choose(1, 1, 1, 1, 2, 2, 2, 3, 3, 4) { // numero de calzadas
    xx = random(o_control.x);
    yy = random(o_control.y);
    cauce = random(360);
    repeat 6 + irandom(12) { // longitud de la calzada
        aux = instance_create(xx, yy, o_decorado);
        aux.tipo = mf_calzada;
        s_creanatura(aux);
        if random(1) < 0.75 {
            cauce += -20 + random(40); }
        else {
            cauce += clamp((-45 + random(90)) * 3, -45, 45); }
        dis = 1 + random(3)
        xx += lengthdir_x(m_tensagua * dis, cauce);
        yy += lengthdir_y(m_tensagua * dis, cauce); } }

// crear decorados, arbustos y rocas
total = 40 + irandom(40);
freno = 0;
do {
    aux = instance_create(random(room_width),
        random(room_height), o_decorado);
    if random(1) < 0.8 {
        aux.tipo = mf_arbusto; }
    else {
        aux.tipo = mf_roca; }
    total -= s_creanatura(aux);
    freno++; }
until (freno > 1000 or total <= 0);

// crear clusters de flores
var dir;
repeat choose(1, 1, 1, 1, 2, 2, 2, 3, 3, 4) { // numero de clusters
    xx = random(o_control.x);
    yy = random(o_control.y);
    repeat 6 + irandom(12) { // flores por cluster
        dis = min(m_floralez, random(m_floralez) * 3);
        dir = random(360);
        aux = instance_create(xx + lengthdir_x(dis, dir),
            yy + lengthdir_y(dis, dir), o_decorado);
        aux.tipo = mf_florez;
        s_creanatura(aux); } }

// crear moscos
repeat m_bichines {
    instance_create(random(room_width), random(room_height), o_mosco); }

