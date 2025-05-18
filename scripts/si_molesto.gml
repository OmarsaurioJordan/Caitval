// ret: verdadero si es un personaje hostil
// arg0: identificador de tipo de unidad

var res = false;
switch argument0 {
    case mt_titan:
    case mt_gigante:
    case mt_salvaje:
    case mt_invasor:
    case mt_ladron:
    case mt_asedio:
    case mt_vendedor:
    case mt_sabio:
        res = true;
        break; }
return res;

