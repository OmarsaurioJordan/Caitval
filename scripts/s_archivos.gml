// administra el sistema de archivos locales del juego
// arg0: instancia que llama y guardara la informacion

with argument0 {
// obtener nombre de ejecuciones previas
ini_open("configuracion.ini");
var ultimo = ini_read_string("config", "ultimo", "");
ini_close();
// obtener los archivos locales
archivo[0, 0] = ""; // nombre del jugador
archivo[0, 1] = ""; // nombre del archivo
archivo[0, 2] = "0"; // avatar del jugador
// estadisticas del jugador
for (var i = 3; i < 8; i++) {
    archivo[0, i] = ""; }
arch_total = 0;
arch_actual = 0;
var aux = file_find_first(working_directory + "\*.ini", 0);
if aux != "" {
    do {
        if aux != "configuracion.ini" {
            ini_open(aux);
            var avv = s_split(ini_read_string("info", "version", "0.0.0"), ".", false);
            var cvv = s_split(o_control.version, ".", false);
            if avv[0] == cvv[0] and avv[1] == cvv[1] {
                arch_total++;
                archivo[arch_total, 0] = ini_read_string("data", "nombre_jugador", "");
                archivo[arch_total, 1] = aux;
                archivo[arch_total, 2] = ini_read_string("data", "avatar", "0");
                // estadisticas
                archivo[arch_total, 3] = ini_read_string("estadisticas", "ciclo", "");
                archivo[arch_total, 4] = ini_read_string("estadisticas", "gente", "");
                archivo[arch_total, 5] = ini_read_string("estadisticas", "dinero", "");
                archivo[arch_total, 6] = ini_read_string("estadisticas", "edificaciones", "");
                archivo[arch_total, 7] = ini_read_string("estadisticas", "mensajes", ""); }
            ini_close();
            // ver si es el archivo usado en ejecuciones previas
            if archivo[arch_total, 0] == ultimo {
                arch_actual = arch_total; } }
        aux = file_find_next(); }
    until (aux == ""); }
file_find_close(); }

