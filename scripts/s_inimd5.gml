// ret: true si el archivo esta bien

var total = "";
var sec;
ini_open(o_control.nombre_archivo);

sec = "info";
total += ini_read_string(sec, "version", "");
total += ini_read_string(sec, "servidor", "");
total += ini_read_string(sec, "tiempo_ciclo", "");
total += ini_read_string(sec, "guardado", "");
total += ini_read_string(sec, "born", "");
sec = "data";
total += ini_read_string(sec, "nombre_jugador", "");
total += ini_read_string(sec, "avatar", "");
total += ini_read_string(sec, "micodigo", "");
total += ini_read_string(sec, "estavivo", "");
total += ini_read_string(sec, "dinero_actual", "");
total += ini_read_string(sec, "dinero_deuda", "");
total += ini_read_string(sec, "dinero_avaluo", "");
total += ini_read_string(sec, "ciclo_edad", "");
total += ini_read_string(sec, "tiempo_edad", "");
total += ini_read_string(sec, "gente_actual", "");
total += ini_read_string(sec, "gente_soporte", "");
total += ini_read_string(sec, "gente_record", "");
total += ini_read_string(sec, "edificaciones_actual", "");
total += ini_read_string(sec, "edificaciones_pro", "");
total += ini_read_string(sec, "edificaciones_record", "");
total += ini_read_string(sec, "envios_bien", "");
total += ini_read_string(sec, "envios_totales", "");
total += ini_read_string(sec, "recepciones_bien", "");
total += ini_read_string(sec, "recepciones_totales", "");
total += ini_read_string(sec, "reloj_atencion", "");
total += ini_read_string(sec, "reloj_edad", "");
total += ini_read_string(sec, "reloj_cuentas", "");
total += ini_read_string(sec, "reloj_influencia", "");
total += ini_read_string(sec, "reloj_ciclo", "");
sec = "prestamistas";
var i = 0;
while ini_key_exists(sec, string(i) + "_0") {
    total += ini_read_string(sec, string(i) + "_0", "");
    total += ini_read_string(sec, string(i) + "_1", "");
    i++ }
sec = "relaciones";
i = 0;
while ini_key_exists(sec, string(i) + "_0") {
    total += ini_read_string(sec, string(i) + "_0", "");
    total += ini_read_string(sec, string(i) + "_1", "");
    total += ini_read_string(sec, string(i) + "_2", "");
    total += ini_read_string(sec, string(i) + "_3", "");
    i++ }
sec = "lascaritas";
i = 0;
while ini_key_exists(sec, string(i) + "_0") {
    total += ini_read_string(sec, string(i) + "_0", "");
    total += ini_read_string(sec, string(i) + "_1", "");
    i++ }
sec = "miscartas";
i = 0;
while ini_key_exists(sec, string(i) + "_0") {
    total += ini_read_string(sec, string(i) + "_0", "");
    total += ini_read_string(sec, string(i) + "_1", "");
    total += ini_read_string(sec, string(i) + "_2", "");
    total += ini_read_string(sec, string(i) + "_3", "");
    total += ini_read_string(sec, string(i) + "_4", "");
    total += ini_read_string(sec, string(i) + "_5", "");
    total += ini_read_string(sec, string(i) + "_6", "");
    i++ }

var cont = 0;
while ini_key_exists("unidad" + string(cont), "x") {
    sec = "unidad" + string(cont);
    total += ini_read_string(sec, "x", "");
    total += ini_read_string(sec, "y", "");
    total += ini_read_string(sec, "propietario", "");
    total += ini_read_string(sec, "retorno", "");
    total += ini_read_string(sec, "estado", "");
    total += ini_read_string(sec, "tipo", "");
    total += ini_read_string(sec, "item", "");
    total += ini_read_string(sec, "vida", "");
    total += ini_read_string(sec, "intentos", "");
    total += ini_read_string(sec, "saldo", "");
    total += ini_read_string(sec, "actuar", "");
    total += ini_read_string(sec, "metax", "");
    total += ini_read_string(sec, "metay", "");
    total += ini_read_string(sec, "blancox", "");
    total += ini_read_string(sec, "blancoy", "");
    total += ini_read_string(sec, "reloj_anima", "");
    total += ini_read_string(sec, "reloj_golpe", "");
    total += ini_read_string(sec, "reloj_andar", "");
    total += ini_read_string(sec, "reloj_trepar", "");
    total += ini_read_string(sec, "reloj_mision", "");
    total += ini_read_string(sec, "reloj_ataque", "");
    total += ini_read_string(sec, "reloj_discurso", "");
    total += ini_read_string(sec, "reloj_vida", "");
    total += ini_read_string(sec, "reloj_actuar", "");
    total += ini_read_string(sec, "reloj_final", "");
    total += ini_read_string(sec, "reloj_guarecido", "");
    cont++; }

cont = 0;
while ini_key_exists("bloque" + string(cont), "x") {
    sec = "bloque" + string(cont);
    total += ini_read_string(sec, "x", "");
    total += ini_read_string(sec, "y", "");
    total += ini_read_string(sec, "estado", "");
    total += ini_read_string(sec, "tipo", "");
    total += ini_read_string(sec, "vida", "");
    total += ini_read_string(sec, "generar", "");
    total += ini_read_string(sec, "guarecidos", "");
    total += ini_read_string(sec, "planeacion", "");
    total += ini_read_string(sec, "estilo", "");
    total += ini_read_string(sec, "reloj_creademuele", "");
    total += ini_read_string(sec, "reloj_anima", "");
    total += ini_read_string(sec, "reloj_humo", "");
    total += ini_read_string(sec, "reloj_arregla", "");
    total += ini_read_string(sec, "reloj_accion", "");
    cont++; }

cont = 0;
while ini_key_exists("decorado" + string(cont), "x") {
    sec = "decorado" + string(cont);
    total += ini_read_string(sec, "x", "");
    total += ini_read_string(sec, "y", "");
    total += ini_read_string(sec, "estado", "");
    total += ini_read_string(sec, "tipo", "");
    total += ini_read_string(sec, "estilo", "");
    total += ini_read_string(sec, "reloj_creademuele", "");
    cont++; }

cont = 0;
while ini_key_exists("transmision" + string(cont), "x") {
    sec = "transmision" + string(cont);
    total += ini_read_string(sec, "x", "");
    total += ini_read_string(sec, "y", "");
    total += ini_read_string(sec, "nombre_destino", "");
    total += ini_read_string(sec, "unidades", "");
    total += ini_read_string(sec, "sonturistas", "");
    total += ini_read_string(sec, "dinero", "");
    total += ini_read_string(sec, "mensaje", "");
    total += ini_read_string(sec, "reloj_vuelo", "");
    cont++; }

cont = 0;
while ini_key_exists("recepcion" + string(cont), "x") {
    sec = "recepcion" + string(cont);
    total += ini_read_string(sec, "x", "");
    total += ini_read_string(sec, "y", "");
    total += ini_read_string(sec, "tipo", "");
    total += ini_read_string(sec, "emisor", "");
    total += ini_read_string(sec, "cantidad", "");
    total += ini_read_string(sec, "limitepro", "");
    total += ini_read_string(sec, "dinero", "");
    total += ini_read_string(sec, "texto", "");
    total += ini_read_string(sec, "reloj_manifestacion", "");
    cont++; }

cont = 0;
while ini_key_exists("proyectil" + string(cont), "x") {
    sec = "proyectil" + string(cont);
    total += ini_read_string(sec, "x", "");
    total += ini_read_string(sec, "y", "");
    total += ini_read_string(sec, "direction", "");
    total += ini_read_string(sec, "reloj_anima", "");
    total += ini_read_string(sec, "reloj_existencia", "");
    cont++; }

cont = 0;
while ini_key_exists("mosco" + string(cont), "x") {
    sec = "mosco" + string(cont);
    total += ini_read_string(sec, "x", "");
    total += ini_read_string(sec, "y", "");
    cont++; }

if ini_key_exists("pichirilo", "x") {
    sec = "pichirilo";
    total += ini_read_string(sec, "x", "");
    total += ini_read_string(sec, "y", ""); }

var res = md5_string_unicode(total + m_codigoini) ==
    ini_read_string("info", "antihack", "");

ini_close();
return res;

