// ret: numero de produccion para aumentar monedas

var pro = 1;
with o_bloque {
    if estado != ms_muerto {
        if tipo == mi_pozo {
            pro++; }
        else if tipo == mi_molino {
            pro += 2; } } }
return pro;

