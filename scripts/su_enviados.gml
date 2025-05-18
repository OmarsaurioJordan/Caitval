// arg0: numero de ciudadanos a enviar de mision

var num = 0;
with o_unidad {
    if estado != me_muerto and (tipo == mt_ciudadano or
            tipo == mt_turista) and estado != me_retirada {
        su_liberabloque(id);
        estado = me_retirada;
        num++;
        if num >= argument0 {
            break; } } }

