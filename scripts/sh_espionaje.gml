// ret: devuelve texto con informacion de espionaje
// esta informacion son 15 datos separados por comas
// nombre, espro, din_act, din_ries, num_prest, edad,
// tiempo, gen_act, gen_sop, edi_act, edi_avan, num_rela,
// envi_son, recep_son, num_aliados, num_enemigos

var txt = o_control.nombre_jugador + ",";

// crear vector de booleanos
var verdad, tot;
do {
    tot = 0;
    for (var i = 0; i < 15; i++) {
        if i == 0 {
            verdad[i] = choose(true, false, false); }
        else if i == 1 or i == 6 or i == 8 {
            verdad[i] = choose(true, true, false); }
        else {
            verdad[i] = choose(true, false); }
        if verdad[i] {
            tot++; } } }
until (tot >= 6 and tot <= 9);

for (var i = 0; i < 15; i++) {
    if verdad[i] {
        switch i {
        case 0: // espro
            if o_control.espro {
                txt += "1"; }
            break;
        case 1: // din_act
            txt += string(o_control.dinero_actual);
            break;
        case 2: // din_ries
            txt += string(o_control.dinero_riesgo * 100);
            break;
        case 3: // num_prest
            if is_array(o_control.prestamistas) {
                txt += string(array_height_2d(o_control.prestamistas)); }
            else {
                txt += "0"; }
            break;
        case 4: // edad
            txt += string(o_control.ciclo_edad);
            break;
        case 5: // tiempo
            txt += string(o_control.tiempo_edad / 60);
            break;
        case 6: // gen_act
            txt += string(o_control.gente_actual);
            break;
        case 7: // gen_sop
            txt += string(o_control.gente_soporte);
            break;
        case 8: // edi_act
            txt += string(o_control.edificaciones_actual);
            break;
        case 9: // edi_avan
            txt += string(o_control.edificaciones_avance * 100);
            break;
        case 10: // num_rela
            if is_array(o_control.relaciones) {
                txt += string(array_height_2d(o_control.relaciones)); }
            else {
                txt += "0"; }
            break;
        case 11: // envi_son
            txt += string(o_control.envios_son);
            break;
        case 12: // recep_son
            txt += string(o_control.recepciones_son);
            break;
        case 13: // num_aliados
            var ggg = 0;
            with o_unidad {
                if estado != me_muerto and (tipo == mt_regalo or tipo == mt_ingeniero or
                        tipo == mt_defensa) {
                    ggg++; } }
            txt += string(ggg);
            break;
        case 14: // num_enemigos
            var ggg = 0;
            with o_unidad {
                if estado != me_muerto and (tipo == mt_vendedor or tipo == mt_sabio or
                        tipo == mt_asedio or tipo == mt_invasor or tipo == mt_ladron) {
                    ggg++; } }
            txt += string(ggg);
            break; } }
    txt += ","; }

txt = string_copy(txt, 1, string_length(txt) - 1);
return txt;

