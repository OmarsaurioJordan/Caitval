// ret: verdadero si debera perseguir enemigos
// arg0: identificador de tipo de unidad

var res = false;
switch argument0 {
    case mt_titan:
    case mt_gigante:
    case mt_salvaje:
    case mt_ciudadano:
    case mt_turista:
    case mt_defensa:
    case mt_invasor:
        res = true;
        break; }
return res;

