// ret: verdadero si el objetivo es blanco de discurso
// arg0: identificador de tipo de unidad persuadidora
// arg1: identificador de tipo de unidad objetivo

var res = false;
switch argument0 {
    case mt_ciudadano:
    case mt_turista:
        switch argument1 {
            case mt_sabio:
            case mt_fugado:
                res = true; break; } break;
    case mt_sabio:
        switch argument1 {
            case mt_ciudadano:
            case mt_turista:
                res = true; break; } break; }
return res;

