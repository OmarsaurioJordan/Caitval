// arg0: linea string a guardar

ini_open(o_control.nombre_archivo);
var t = 0;
while ini_key_exists("historial", "t" + string(t)) {
    t++; }
ini_write_string("historial", "t" + string(t),
    date_datetime_string(date_current_datetime()) +
    " - " + argument0);
ini_close();

