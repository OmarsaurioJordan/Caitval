// trata de convencer a blanco cercano segun clases
// arg0: id quien llama

var res = false;
if argument0.intentos > 0 {
    var alcance = mu_radio;
    if argument0.estado == me_guarecido {
        var mib = si_mibloque(argument0);
        if mib != noone {
            alcance = si_radio(mib.tipo); } }
    var blanco = su_discursable(argument0, alcance, mu_radio * 4);
    if blanco != noone {
        res = true;
        var influencia = 0.25;
        if string_count("G", argument0.item) != 0 {
            influencia = 0.5; }
        argument0.intentos--;
        if argument0.intentos <= 0 {
            if argument0.tipo == mt_sabio {
                argument0.estado = me_retirada; }
            else {
                argument0.item = string_replace_all(argument0.item, "G", ""); } }
        su_parla(blanco, influencia, argument0.retorno); } }
return res;

