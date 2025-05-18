// ret: verdadero si el objetivo es blanco de ataque
// arg0: identificador de tipo de unidad atacante
// arg1: identificador de tipo de unidad objetivo

var res = false;
switch argument0 {
    case mt_titan:
    case mt_gigante:
    case mt_salvaje:
        switch argument1 {
            case mt_salvaje: case mt_gigante: case mt_titan: break;
            default: res = true; break; } break;
    case mt_ciudadano:
        switch argument1 {
            case mt_salvaje: case mt_gigante: case mt_titan:
            case mt_asedio: case mt_invasor: case mt_ladron:
                res = true; break; } break;
    case mt_turista:
    case mt_defensa:
        switch argument1 {
            case mt_salvaje: case mt_gigante: case mt_titan:
            case mt_asedio: case mt_invasor:
                res = true; break; } break;
    case mt_espia:
    case mt_fugado:
    case mt_asedio:
    case mt_cartero:
    case mt_ingeniero:
    case mt_regalo:
    case mt_sabio:
    case mt_ladron:
    case mt_vendedor:
        switch argument1 {
            case mt_salvaje: case mt_gigante: case mt_titan:
                res = true; break; } break;
    case mt_invasor:
        switch argument1 {
            case mt_salvaje: case mt_gigante: case mt_titan:
            case mt_ciudadano: case mt_turista: case mt_defensa:
            case mt_regalo: case mt_ingeniero:
                res = true; break; } break; }
return res;

