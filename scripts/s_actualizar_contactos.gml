// arg0: cadena de avatares y nombres a0,n0,a1,n1,a2,n2,a3,n3,

// mantener aguja arriba
var arriba = false;
var v = 0;
if is_array(o_control.contactos) {
    v = array_height_2d(o_control.contactos); }
if o_control.desf_cont == v - 1 {
    arriba = true; }
// obtener el vector con avatares y nombres
var total = s_split(argument0, ',', true);
if is_array(total) {
    if frac(array_length_1d(total) * 0.5) == 0 {
        var vec = noone;
        var n = 0;
        for (var i = 0; i < array_length_1d(total); i += 2) {
            vec[n, 0] = total[i]; // avatar
            vec[n, 1] = total[i + 1]; // nombre
            vec[n, 2] = 0; // influencia_tmp
            vec[n, 3] = false; // seleccionado
            vec[n, 4] = 0.5; //  recepciones_son
            si_suavatar(total[i + 1], real(total[i]));
            n++; }
        // combinar con informacion previa en o_control (relaciones)
        if is_array(o_control.relaciones) {
            for (var i = 0; i < array_height_2d(vec); i++) {
                for (var k = 0; k < array_height_2d(o_control.relaciones); k++) {
                    if o_control.relaciones[k, 0] == vec[i, 1] {
                        vec[i, 2] = o_control.relaciones[k, 1];
                        if o_control.relaciones[k, 3] != 0 {
                            vec[i, 4] = o_control.relaciones[k, 2] /
                                o_control.relaciones[k, 3]; }
                        else {
                            vec[i, 4] = 0.5; } } } } }
        // hallar el seleccionado actual en o_control (contactos)
        if is_array(o_control.contactos) {
            var m = "";
            for (var k = 0; k < array_height_2d(o_control.contactos); k++) {
                if o_control.contactos[k, 3] {
                    m = o_control.contactos[k, 1];
                    break; } }
            if m != "" {
                for (var i = 0; i < array_height_2d(vec); i++) {
                    if vec[i, 1] == m {
                        vec[i, 3] = true;
                        break; } } } }
        // ordenar segun la prioridad
        var new = noone;
        var q, tmp;
        for (var i = array_height_2d(vec) - 1; i > -1 ; i--) {
            q = 0;
            tmp = -1;
            for (var k = 0; k < array_height_2d(vec); k++) {
                if vec[k, 2] > tmp {
                    tmp = vec[k, 2];
                    q = k; } }
            for (var h = 0; h < 5; h++) {
                new[i, h] = vec[q, h]; }
            vec[q, 2] = -1; }
        // reemplazar el vector original
        o_control.contactos = new; } }
else {
    o_control.contactos = noone; }
// prevenir salirse del maximo de la lista al leerla
if is_array(o_control.contactos) {
    if arriba {
        o_control.desf_cont = array_height_2d(o_control.contactos) - 1; }
    else {
        o_control.desf_cont = clamp(o_control.desf_cont, 0, array_height_2d(o_control.contactos) - 1); } }

