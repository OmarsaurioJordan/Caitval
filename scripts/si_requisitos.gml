// arg0: indice de envio o edificacion a averiguar requisitos
// arg1: cantidad del envio
// arg2: verdadero si es envio, falso si es construir
// ret: valor del requisito

var res = m_dolar;
if argument2 {
    switch argument0 {
        case mv_colaboracion: res *= 3; break;
        case mv_espionaje: res *= 0.3; break;
        case mv_persuacion: res *= 0.6; break;
        case mv_migrantes: res *= 0.2; break;
        case mv_robo: res *= 0.2; break;
        case mv_venta: res *= 1; break;
        case mv_regalo: res *= 1; break;
        case mv_asedio: res *= 2.5; break;
        case mv_defensa: res *= 0.4; break;
        case mv_invasion: res *= 0.5; break;
        case mv_carta: res *= 0.1; break; }
    res *= argument1; }
else {
    switch argument0 {
        case mj_casa: res *= 2.5; break;
        case mj_pozo: res *= 2; break;
        case mj_fuerte: res *= 3; break;
        case mj_templo: res *= 4; break;
        case mj_mejorar: res *= 6; break;
        case mj_demoler: res *= 0.7; break; } }
return ceil(res);

