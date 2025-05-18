// golpea a algun blanco cercano segun clases
// arg0: id quien llama

var res = false;
var alcance = mu_radio;
if argument0.estado == me_guarecido {
    var mib = si_mibloque(argument0);
    if mib != noone {
        alcance = si_radio(mib.tipo); } }
var blanco = su_blanco(argument0, alcance, mu_radio * 3);
if blanco != noone {
    res = true;
    var ataque = 1;
    if argument0.tipo == mt_gigante { ataque = 2; }
    else if argument0.tipo == mt_titan { ataque = 4; }
    su_golpe(blanco, ataque);
    if blanco.vida == 0 {
        // tumbar edificio si titan
        if blanco.estado == me_guarecido and argument0.tipo == mt_titan and
                argument0.actuar == 1 {
            var miv = si_mibloque(blanco);
            if miv != noone {
                argument0.actuar = 0;
                miv.vida--;
                if miv.vida <= 0 {
                    miv.estado = ms_muerto;
                    su_saledemolicion();
                    audio_play_sound(a_demolision, 95, false);
                    s_history("Construccion Destruida"); }
                else {
                    miv.reloj_arregla = m_arreglar * m_seg; } } }
        // morir como tal
        su_morir(blanco); }
    else if blanco.vida <= mu_vida * 0.2 and (blanco.tipo == mt_invasor or
            blanco.tipo == mt_defensa) {
        blanco.estado = me_retirada; } }
return res;

