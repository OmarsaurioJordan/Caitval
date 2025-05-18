// ret: string con el nombre del envio
// arg0: id identificador del envio

var res = "";
switch argument0 {
    case mv_carta: res = "Carta"; break;
    case mv_colaboracion: res = "Colaboracion"; break;
    case mv_espionaje: res = "Espionaje"; break;
    case mv_persuacion: res = "Persuacion"; break;
    case mv_migrantes: res = "Migrantes"; break;
    case mv_robo: res = "Robo"; break;
    case mv_venta: res = "Venta"; break;
    case mv_regalo: res = "Regalo"; break;
    case mv_asedio: res = "Asedio"; break;
    case mv_defensa: res = "Defensa"; break;
    case mv_invasion: res = "Invasion"; break; }
return res;

