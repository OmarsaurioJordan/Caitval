// arg0: tipo de envio o recepcion
// arg1: true si pregunta por bueno, false si pregunta en general
// ret: 1 si es considerado bueno o general, sino 0

var res;
if argument1 {
    res = 0;
    switch argument0 {
        case mv_colaboracion:
        case mv_migrantes:
        case mv_regalo:
        case mv_defensa:
            res = 1; break; } }
else {
    res = 1;
    switch argument0 {
        case mv_espionaje:
        case mv_carta:
        case mv_informe:
        case mv_retorno:
            res = 0; break; } }
return res;

