// ret: verdadero si es un enemigo a golpear
// arg0: identificador de tipo de unidad

var res = false;
switch argument0 {
    case mt_titan:
    case mt_gigante:
    case mt_salvaje:
    case mt_invasor:
    case mt_ladron:
    case mt_asedio:
        res = true;
        break; }
return res;

