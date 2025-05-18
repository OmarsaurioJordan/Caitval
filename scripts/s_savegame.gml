// guarda toda la partida

var his = noone;
var born = date_current_datetime();

if file_exists(o_control.nombre_archivo) {
    ini_open(o_control.nombre_archivo);
    born = real(ini_read_string("info", "born", string(born)));
    var t = 0;
    while ini_key_exists("historial", "t" + string(t)) {
        his[t] = ini_read_string("historial", "t" + string(t), "");
        t++; }
    ini_close();
    file_delete(o_control.nombre_archivo); }
else {
    his[0] = "Historial Caitval, " + date_datetime_string(born);
    his[1] = "Partida: " + o_control.nombre_jugador;
    his[2] = "..."; }

var total = "";
var sec;
ini_open(o_control.nombre_archivo);

with o_control
{
    sec = "info";
    total += s_varsave(sec, "version", version);
    total += s_varsave(sec, "servidor", servidor);
    total += s_varsave(sec, "tiempo_ciclo", tiempo_ciclo);
    total += s_varsave(sec, "guardado", date_current_datetime());
    total += s_varsave(sec, "born", born);
    sec = "historial";
    for (var t = 0; t < array_length_1d(his); t++) {
        s_varsave(sec, "t" + string(t), his[t]); }
    sec = "data";
    total += s_varsave(sec, "nombre_jugador", nombre_jugador);
    total += s_varsave(sec, "avatar", avatar);
    total += s_varsave(sec, "micodigo", micodigo);
    total += s_varsave(sec, "estavivo", estavivo);
    total += s_varsave(sec, "dinero_actual", dinero_actual);
    total += s_varsave(sec, "dinero_deuda", dinero_deuda);
    total += s_varsave(sec, "dinero_avaluo", dinero_avaluo);
    total += s_varsave(sec, "ciclo_edad", ciclo_edad);
    total += s_varsave(sec, "tiempo_edad", tiempo_edad);
    total += s_varsave(sec, "gente_actual", gente_actual);
    total += s_varsave(sec, "gente_soporte", gente_soporte);
    total += s_varsave(sec, "gente_record", gente_record);
    total += s_varsave(sec, "edificaciones_actual", edificaciones_actual);
    total += s_varsave(sec, "edificaciones_pro", edificaciones_pro);
    total += s_varsave(sec, "edificaciones_record", edificaciones_record);
    total += s_varsave(sec, "envios_bien", envios_bien);
    total += s_varsave(sec, "envios_totales", envios_totales);
    total += s_varsave(sec, "recepciones_bien", recepciones_bien);
    total += s_varsave(sec, "recepciones_totales", recepciones_totales);
    total += s_varsave(sec, "reloj_atencion", reloj_atencion);
    total += s_varsave(sec, "reloj_edad", reloj_atencion);
    total += s_varsave(sec, "reloj_cuentas", reloj_atencion);
    total += s_varsave(sec, "reloj_influencia", reloj_influencia);
    with o_turno {
        total += s_varsave(sec, "reloj_ciclo", reloj_ciclo); }
    if is_array(prestamistas) {
        sec = "prestamistas";
        for (var i = 0; i < array_height_2d(prestamistas); i++) {
            total += s_varsave(sec, string(i) + "_0", prestamistas[i, 0]);
            total += s_varsave(sec, string(i) + "_1", prestamistas[i, 1]); } }
    if is_array(relaciones) {
        sec = "relaciones";
        for (var i = 0; i < array_height_2d(relaciones); i++) {
            total += s_varsave(sec, string(i) + "_0", relaciones[i, 0]);
            total += s_varsave(sec, string(i) + "_1", relaciones[i, 1]);
            total += s_varsave(sec, string(i) + "_2", relaciones[i, 2]);
            total += s_varsave(sec, string(i) + "_3", relaciones[i, 3]); } }
    if is_array(lascaritas) {
        sec = "lascaritas";
        for (var i = 0; i < array_height_2d(lascaritas); i++) {
            total += s_varsave(sec, string(i) + "_0", lascaritas[i, 0]);
            total += s_varsave(sec, string(i) + "_1", lascaritas[i, 1]);} }
    if is_array(miscartas) {
        sec = "miscartas";
        for (var i = 0; i < array_height_2d(miscartas); i++) {
            total += s_varsave(sec, string(i) + "_0", miscartas[i, 0]);
            total += s_varsave(sec, string(i) + "_1", miscartas[i, 1]);
            total += s_varsave(sec, string(i) + "_2", miscartas[i, 2]);
            total += s_varsave(sec, string(i) + "_3", miscartas[i, 3]);
            total += s_varsave(sec, string(i) + "_4", miscartas[i, 4]);
            total += s_varsave(sec, string(i) + "_5", miscartas[i, 5]);
            total += s_varsave(sec, string(i) + "_6", miscartas[i, 6]); } }
    sec = "estadisticas";
    if date_is_today(born) {
        s_varsave(sec, "ciclo", string(ciclo_edad) + " (" + string(tiempo_edad / 60) +
            "h -> " + date_time_string(born) + ")"); }
    else {
        s_varsave(sec, "ciclo", string(ciclo_edad) + " (" + string(tiempo_edad / 60) +
            "h -> " + date_date_string(born) + ")"); }
    s_varsave(sec, "gente", string(gente_actual) + " / " + string(gente_soporte));
    s_varsave(sec, "dinero", string(floor(dinero_actual)) + " / -" + string(dinero_riesgo * 100) + "%");
    s_varsave(sec, "edificaciones", string(edificaciones_actual) + " / " + string(edificaciones_avance * 100) + "%");
    s_varsave(sec, "mensajes", string(envios_son) + "% / " + string(recepciones_son) + "%");
}

var cont = 0;
with o_unidad {
    sec = "unidad" + string(cont);
    total += s_varsave(sec, "x", x);
    total += s_varsave(sec, "y", y);
    total += s_varsave(sec, "propietario", propietario);
    total += s_varsave(sec, "retorno", retorno);
    total += s_varsave(sec, "estado", estado);
    total += s_varsave(sec, "tipo", tipo);
    total += s_varsave(sec, "item", item);
    total += s_varsave(sec, "vida", vida);
    total += s_varsave(sec, "intentos", intentos);
    total += s_varsave(sec, "saldo", saldo);
    total += s_varsave(sec, "actuar", actuar);
    total += s_varsave(sec, "metax", metax);
    total += s_varsave(sec, "metay", metay);
    total += s_varsave(sec, "blancox", blancox);
    total += s_varsave(sec, "blancoy", blancoy);
    total += s_varsave(sec, "reloj_anima", reloj_anima);
    total += s_varsave(sec, "reloj_golpe", reloj_golpe);
    total += s_varsave(sec, "reloj_andar", reloj_andar);
    total += s_varsave(sec, "reloj_trepar", reloj_trepar);
    total += s_varsave(sec, "reloj_mision", reloj_mision);
    total += s_varsave(sec, "reloj_ataque", reloj_ataque);
    total += s_varsave(sec, "reloj_discurso", reloj_discurso);
    total += s_varsave(sec, "reloj_vida", reloj_vida);
    total += s_varsave(sec, "reloj_actuar", reloj_actuar);
    total += s_varsave(sec, "reloj_final", reloj_final);
    total += s_varsave(sec, "reloj_guarecido", reloj_guarecido);
    cont++; }

cont = 0;
with o_bloque {
    sec = "bloque" + string(cont);
    total += s_varsave(sec, "x", x);
    total += s_varsave(sec, "y", y);
    total += s_varsave(sec, "estado", estado);
    total += s_varsave(sec, "tipo", tipo);
    total += s_varsave(sec, "vida", vida);
    total += s_varsave(sec, "generar", generar);
    total += s_varsave(sec, "guarecidos", guarecidos);
    total += s_varsave(sec, "planeacion", planeacion);
    total += s_varsave(sec, "estilo", estilo);
    total += s_varsave(sec, "reloj_creademuele", reloj_creademuele);
    total += s_varsave(sec, "reloj_anima", reloj_anima);
    total += s_varsave(sec, "reloj_humo", reloj_humo);
    total += s_varsave(sec, "reloj_arregla", reloj_arregla);
    total += s_varsave(sec, "reloj_accion", reloj_accion);
    cont++; }

cont = 0;
with o_decorado {
    sec = "decorado" + string(cont);
    total += s_varsave(sec, "x", x);
    total += s_varsave(sec, "y", y);
    total += s_varsave(sec, "estado", estado);
    total += s_varsave(sec, "tipo", tipo);
    total += s_varsave(sec, "estilo", estilo);
    total += s_varsave(sec, "reloj_creademuele", reloj_creademuele);
    cont++; }

cont = 0;
with o_transmision {
    sec = "transmision" + string(cont);
    total += s_varsave(sec, "x", x);
    total += s_varsave(sec, "y", y);
    total += s_varsave(sec, "nombre_destino", nombre_destino);
    total += s_varsave(sec, "unidades", unidades);
    total += s_varsave(sec, "sonturistas", sonturistas);
    total += s_varsave(sec, "dinero", dinero);
    total += s_varsave(sec, "mensaje", mensaje);
    total += s_varsave(sec, "reloj_vuelo", reloj_vuelo);
    cont++; }

cont = 0;
with o_recepcion {
    sec = "recepcion" + string(cont);
    total += s_varsave(sec, "x", x);
    total += s_varsave(sec, "y", y);
    total += s_varsave(sec, "tipo", tipo);
    total += s_varsave(sec, "emisor", emisor);
    total += s_varsave(sec, "cantidad", cantidad);
    total += s_varsave(sec, "limitepro", limitepro);
    total += s_varsave(sec, "dinero", dinero);
    total += s_varsave(sec, "texto", texto);
    total += s_varsave(sec, "reloj_manifestacion", reloj_manifestacion);
    cont++; }

cont = 0;
with o_proyectil {
    sec = "proyectil" + string(cont);
    total += s_varsave(sec, "x", x);
    total += s_varsave(sec, "y", y);
    total += s_varsave(sec, "direction", direction);
    total += s_varsave(sec, "reloj_anima", reloj_anima);
    total += s_varsave(sec, "reloj_existencia", reloj_existencia);
    cont++; }

cont = 0;
with o_mosco {
    sec = "mosco" + string(cont);
    total += s_varsave(sec, "x", x);
    total += s_varsave(sec, "y", y);
    cont++; }

if instance_exists(o_pichirilo) {
    sec = "pichirilo";
    total += s_varsave(sec, "x", x);
    total += s_varsave(sec, "y", y);}

ini_write_string("info", "antihack", md5_string_unicode(total + m_codigoini));
ini_close();

