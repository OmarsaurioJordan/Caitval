// arg0: cadena string de informacion proveniente del servidor
// ret: string listo para pintarse en la carta rx
// esta informacion son 15 datos separados por comas
// nombre, espro, din_act, din_ries, num_prest, edad,
// tiempo, gen_act, gen_sop, edi_act, edi_avan, num_rela,
// envi_son, recep_son, num_aliados, num_enemigos

var txt = "";
var data = s_split(argument0, ",", false);
for (var i = 0; i < array_length_1d(data); i++) {
    if data[i] != "" {
        if i == 12 or i == 13 {
            txt += string_replace_all(sd_discurso(mm_informe + i), "&",
                sd_discurso(mm_informe + 30 + si_icono_relacion(real(data[i])))); }
        else {
            txt += string_replace_all(sd_discurso(mm_informe + i), "&", data[i]); } } }
txt = string_copy(txt, 1, string_length(txt) - 2);
return txt;

