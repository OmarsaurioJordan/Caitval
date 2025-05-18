// arg0: seccion del ini
// arg1: key del ini
// arg2: true si es real, false string

var res;
if argument2 {
    res = real(ini_read_string(argument0, argument1, "0")); }
else {
    res = ini_read_string(argument0, argument1, ""); }
return res;

