// arg0: valor del envio
// arg1: indice de tipo de envio
// ret: 1 si debe limitarlo, sino arg0

var res = argument0;
switch argument1 {
    case mv_colaboracion:
    case mv_asedio:
    case mv_carta:
    case mv_espionaje:
        res = 1;
        break; }
return res;

