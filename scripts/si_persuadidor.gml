// ret: verdadero si debera persuadir enemigos
// arg0: identificador de tipo de unidad

var res = false;
switch argument0 {
    case mt_ciudadano:
    case mt_turista:
    case mt_sabio:
        res = true;
        break; }
return res;

