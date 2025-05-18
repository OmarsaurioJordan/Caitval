// ret: numero de poblacion actual

var res = 0;
with o_unidad {
    if estado != me_muerto and (tipo == mt_ciudadano or
            tipo == mt_turista) and estado != me_retirada {
        res++; } }
return res;

