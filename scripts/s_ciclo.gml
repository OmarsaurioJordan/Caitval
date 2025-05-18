// se ejecuta cada que acaba un ciclo

with o_control {
    ciclo_edad++;
    var ant = dinero_actual;
    var newd = min(m_dolar * si_productores(), gente_actual * m_dolar * 0.25);
    dinero_actual = min(dinero_actual + newd,
        m_dolar * si_productores() * 3);
    if dinero_actual < ant {
        dinero_actual = ant; }
    s_pago(newd); }

with o_bloque {
    if tipo == mi_casa {
        generar = 1; }
    else if tipo == mi_edificio {
        generar = 2; } }

var bn = instance_number(o_mosco);
if bn == m_bichines and o_control.espro != 0 {
    do {
        instance_create(room_width * 0.5, 0, o_mosco);
        bn++; }
    until (bn >= m_bichines * 2); }

s_savegame();
s_history("Ciclo " + string(o_control.ciclo_edad));

