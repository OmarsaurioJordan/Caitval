// arg0: true si incluir tambien a las no pro, false solo pro
// ret: numero de edificaciones actual

var res = 0;
with o_bloque {
    if estado != ms_muerto and tipo != mi_arbol and tipo != mi_piedra {
        if (tipo == mi_edificio or tipo == mi_molino or tipo == mi_torre or
                tipo == mi_planetario) or argument0 {
            res++; } } }
return res;

