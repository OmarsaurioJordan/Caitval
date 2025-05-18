// ret: numero de poblacion maxima soportada

var res = 0;
with o_bloque {
    if estado != ms_muerto {
        switch tipo {
            case mi_casa:
                res += 4; break;
            case mi_edificio:
                res += 8; break; } } }
return res;

