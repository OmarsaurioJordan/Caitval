// arg0: seccion del ini
// arg1: key del ini
// arg2: variable a guardar en el archivo ini
// ret: devuelve la variable en forma string

var res;
if typeof(argument2) == "string" {
    res = argument2; }
else {
    res = string(argument2); }
ini_write_string(argument0, argument1, res);
return res;

