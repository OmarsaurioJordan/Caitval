// arg0: id de tipo de envio
// arg1: true si es para envio, false si para ver maximo de ciudad
// ret: numero de unidades pro que se pueden enviar

var res = 0;
if argument1 {
    switch argument0 {
        case mv_invasion:
        case mv_defensa:
            with o_bloque {
                if estado != ms_muerto {
                    if tipo == mi_fuerte {
                        res += 1; }
                    else if tipo == mi_torre {
                        res += 2; } } }
            break;
        case mv_venta:
            with o_bloque {
                if estado != ms_muerto {
                    if tipo == mi_pozo {
                        res += 1; }
                    else if tipo == mi_molino {
                        res += 2; } } }
            break;
        case mv_persuacion:
            with o_bloque {
                if estado != ms_muerto {
                    if tipo == mi_templo {
                        res += 1; }
                    else if tipo == mi_planetario {
                        res += 2; } } }
            break; } }
else {
    switch argument0 {
        case mv_invasion:
        case mv_defensa:
            with o_bloque {
                if estado != ms_muerto {
                    if tipo == mi_fuerte {
                        res += 3; }
                    else if tipo == mi_torre {
                        res += 5; } } }
            break;
        case mv_venta:
            with o_bloque {
                if estado != ms_muerto {
                    if tipo == mi_pozo {
                        res += 2; }
                    else if tipo == mi_molino {
                        res += 4; } } }
            break;
        case mv_persuacion:
            with o_bloque {
                if estado != ms_muerto {
                    if tipo == mi_templo {
                        res += 1; }
                    else if tipo == mi_planetario {
                        res += 3; } } }
            break; } }
return res;

