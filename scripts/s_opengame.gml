// abre la partida y carga todo para jugar

// verifica que el archivo no se halla modificado ilegalmente
if s_inimd5() {

var sec;
ini_open(o_control.nombre_archivo);
var pasado = date_second_span(date_current_datetime(),
    s_varopen("data", "guardado", true)) * m_seg;

with o_control
{
    sec = "data";
    estavivo = s_varopen(sec, "estavivo", true);
    dinero_actual = s_varopen(sec, "dinero_actual", true);
    dinero_deuda = s_varopen(sec, "dinero_deuda", true);
    dinero_avaluo = s_varopen(sec, "dinero_avaluo", true);
    ciclo_edad = s_varopen(sec, "ciclo_edad", true);
    tiempo_edad = s_varopen(sec, "tiempo_edad", true);
    gente_actual = s_varopen(sec, "gente_actual", true);
    gente_soporte = s_varopen(sec, "gente_soporte", true);
    gente_record = s_varopen(sec, "gente_record", true);
    edificaciones_actual = s_varopen(sec, "edificaciones_actual", true);
    edificaciones_pro = s_varopen(sec, "edificaciones_pro", true);
    edificaciones_record = s_varopen(sec, "edificaciones_record", true);
    envios_bien = s_varopen(sec, "envios_bien", true);
    envios_totales = s_varopen(sec, "envios_totales", true);
    recepciones_bien = s_varopen(sec, "recepciones_bien", true);
    recepciones_totales = s_varopen(sec, "recepciones_totales", true);
    reloj_atencion = s_varopen(sec, "reloj_atencion", true);
    reloj_edad = s_varopen(sec, "reloj_edad", true);
    reloj_cuentas = s_varopen(sec, "reloj_cuentas", true);
    reloj_influencia = s_varopen(sec, "reloj_influencia", true) - pasado;
    with o_turno {
        reloj_ciclo = s_varopen(sec, "reloj_ciclo", true) - pasado; }
    sec = "prestamistas";
    prestamistas = noone;
    var i = 0;
    while ini_key_exists(sec, string(i) + "_0") {
        prestamistas[i, 0] = s_varopen(sec, string(i) + "_0", false);
        prestamistas[i, 1] = s_varopen(sec, string(i) + "_1", true);
        i++; }
    sec = "relaciones";
    contactos = noone;
    relaciones = noone;
    i = 0;
    while ini_key_exists(sec, string(i) + "_0") {
        relaciones[i, 0] = s_varopen(sec, string(i) + "_0", false);
        relaciones[i, 1] = s_varopen(sec, string(i) + "_1", true);
        relaciones[i, 2] = s_varopen(sec, string(i) + "_2", true);
        relaciones[i, 3] = s_varopen(sec, string(i) + "_3", true);
        i++; }
    sec = "lascaritas";
    lascaritas = noone;
    i = 0;
    while ini_key_exists(sec, string(i) + "_0") {
        lascaritas[i, 0] = s_varopen(sec, string(i) + "_0", true);
        lascaritas[i, 1] = s_varopen(sec, string(i) + "_1", false);
        i++; }
    sec = "miscartas";
    miscartas = noone;
    i = 0;
    while ini_key_exists(sec, string(i) + "_0") {
        miscartas[i, 0] = s_varopen(sec, string(i) + "_0", true);
        miscartas[i, 1] = s_varopen(sec, string(i) + "_1", false);
        miscartas[i, 2] = s_varopen(sec, string(i) + "_2", true);
        miscartas[i, 3] = s_varopen(sec, string(i) + "_3", true);
        miscartas[i, 4] = s_varopen(sec, string(i) + "_4", false);
        miscartas[i, 5] = s_varopen(sec, string(i) + "_5", true);
        miscartas[i, 6] = s_varopen(sec, string(i) + "_6", true);
        i++; }
}

var aux;
var cont = 0;
while ini_key_exists("unidad" + string(cont), "x") {
    sec = "unidad" + string(cont);
    aux = instance_create(s_varopen(sec, "x", true),
        s_varopen(sec, "y", true), o_unidad);
    aux.propietario = s_varopen(sec, "propietario", false);
    aux.retorno = s_varopen(sec, "retorno", false);
    aux.estado = s_varopen(sec, "estado", true);
    aux.tipo = s_varopen(sec, "tipo", true);
    aux.item = s_varopen(sec, "item", false);
    aux.vida = s_varopen(sec, "vida", true);
    aux.intentos = s_varopen(sec, "intentos", true);
    aux.saldo = s_varopen(sec, "saldo", true);
    aux.actuar = s_varopen(sec, "actuar", true);
    aux.metax = s_varopen(sec, "metax", true);
    aux.metay = s_varopen(sec, "metay", true);
    aux.blancox = s_varopen(sec, "blancox", true);
    aux.blancoy = s_varopen(sec, "blancoy", true);
    aux.reloj_anima = s_varopen(sec, "reloj_anima", true);
    aux.reloj_golpe = s_varopen(sec, "reloj_golpe", true);
    aux.reloj_andar = s_varopen(sec, "reloj_andar", true);
    aux.reloj_trepar = s_varopen(sec, "reloj_trepar", true);
    aux.reloj_mision = s_varopen(sec, "reloj_mision", true);
    aux.reloj_ataque = s_varopen(sec, "reloj_ataque", true);
    aux.reloj_discurso = s_varopen(sec, "reloj_discurso", true);
    aux.reloj_vida = s_varopen(sec, "reloj_vida", true);
    aux.reloj_actuar = s_varopen(sec, "reloj_actuar", true);
    aux.reloj_final = s_varopen(sec, "reloj_final", true);
    aux.reloj_guarecido = s_varopen(sec, "reloj_guarecido", true);
    cont++; }

cont = 0;
while ini_key_exists("bloque" + string(cont), "x") {
    sec = "bloque" + string(cont);
    aux = instance_create(s_varopen(sec, "x", true),
        s_varopen(sec, "y", true), o_bloque);
    aux.estado = s_varopen(sec, "estado", true);
    aux.tipo = s_varopen(sec, "tipo", true);
    aux.vida = s_varopen(sec, "vida", true);
    aux.generar = s_varopen(sec, "generar", true);
    aux.guarecidos = s_varopen(sec, "guarecidos", true);
    aux.planeacion = s_varopen(sec, "planeacion", true);
    aux.estilo = s_varopen(sec, "estilo", true);
    aux.reloj_creademuele = s_varopen(sec, "reloj_creademuele", true);
    aux.reloj_anima = s_varopen(sec, "reloj_anima", true);
    aux.reloj_humo = s_varopen(sec, "reloj_humo", true);
    aux.reloj_arregla = s_varopen(sec, "reloj_arregla", true);
    aux.reloj_accion = s_varopen(sec, "reloj_accion", true);
    cont++; }

cont = 0;
while ini_key_exists("decorado" + string(cont), "x") {
    sec = "decorado" + string(cont);
    aux = instance_create(s_varopen(sec, "x", true),
        s_varopen(sec, "y", true), o_decorado);
    aux.estado = s_varopen(sec, "estado", true);
    aux.tipo = s_varopen(sec, "tipo", true);
    aux.estilo = s_varopen(sec, "estilo", true);
    aux.reloj_creademuele = s_varopen(sec, "reloj_creademuele", true);
    cont++; }

cont = 0;
while ini_key_exists("transmision" + string(cont), "x") {
    sec = "transmision" + string(cont);
    aux = instance_create(s_varopen(sec, "x", true),
        s_varopen(sec, "y", true), o_transmision);
    aux.nombre_destino = s_varopen(sec, "nombre_destino", false);
    aux.unidades = s_varopen(sec, "unidades", true);
    aux.sonturistas = s_varopen(sec, "sonturistas", true);
    aux.dinero = s_varopen(sec, "dinero", true);
    aux.mensaje = s_varopen(sec, "mensaje", false);
    aux.reloj_vuelo = s_varopen(sec, "reloj_vuelo", true);
    cont++; }

cont = 0;
while ini_key_exists("recepcion" + string(cont), "x") {
    sec = "recepcion" + string(cont);
    aux = instance_create(s_varopen(sec, "x", true),
        s_varopen(sec, "y", true), o_recepcion);
    aux.tipo = s_varopen(sec, "tipo", true);
    aux.emisor = s_varopen(sec, "emisor", false);
    aux.cantidad = s_varopen(sec, "cantidad", true);
    aux.limitepro = s_varopen(sec, "limitepro", true);
    aux.dinero = s_varopen(sec, "dinero", true);
    aux.texto = s_varopen(sec, "texto", false);
    aux.reloj_manifestacion = s_varopen(sec, "reloj_manifestacion", true);
    cont++; }

cont = 0;
while ini_key_exists("proyectil" + string(cont), "x") {
    sec = "proyectil" + string(cont);
    aux = instance_create(s_varopen(sec, "x", true),
        s_varopen(sec, "y", true), o_proyectil);
    aux.direction = s_varopen(sec, "direction", true);
    aux.reloj_anima = s_varopen(sec, "reloj_anima", true);
    aux.reloj_existencia = s_varopen(sec, "reloj_existencia", true);
    cont++; }

cont = 0;
while ini_key_exists("mosco" + string(cont), "x") {
    sec = "mosco" + string(cont);
    aux = instance_create(s_varopen(sec, "x", true),
        s_varopen(sec, "y", true), o_mosco);
    cont++; }

if ini_key_exists("pichirilo", "x") {
    sec = "pichirilo";
    instance_create(s_varopen(sec, "x", true),
        s_varopen(sec, "y", true), o_pichirilo); }

ini_close(); }

// si el archivo fue ilegalmente modificado
else {
    var mm = instance_create(0, 0, o_menu);
    mm.loggg = sd_discurso(12);
    s_history("Partida modificada ilegalmente");
    background_visible[2] = true;
    with o_turno { instance_destroy(); }
    with o_construir { instance_destroy(); }
    with o_redactar { instance_destroy(); } }

