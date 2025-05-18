// guardara informacion del juego cada m_cuentas seg en txt
// tiempo s ejec actual, 

var sep = " ";
if o_control.debug {
if !file_exists(o_control.nombre_jugador + ".txt") {
    var ff = file_text_open_write(o_control.nombre_jugador + ".txt");
    file_text_write_string(ff, string_replace_all("segundo,dinero,deuda,poblacion," +
        "saldo,intentos,actuar,vida,escudo,trapo,gorro,guarecido," +
        "invasores,vida_inv,escudo_inv,sabios,intentos_sab,gorro_sab," +
        "vendedores,saldo_ven,trapo_ven,fugados_sab,fugados_sobrepoblacion," +
        "otros", ",", sep));
    file_text_writeln(ff); }
else {
    var ff = file_text_open_append(o_control.nombre_jugador + ".txt"); }
var ciu = 0; var ss = 0; var ii = 0; var aa = 0; var vv = 0;
var esc = 0; var tra = 0; var gor = 0; var gua = 0;
var inv = 0; var ivv = 0; var iesc = 0; var fug1 = 0;
var sab = 0; var sii = 0; var sgor = 0; var fug2 = 0;
var ven = 0; var vss = 0; var vtra = 0; var otr = 0;
with o_unidad {
    if estado != me_muerto {
        switch tipo {
        case mt_ciudadano:
        case mt_turista:
            ciu++;
            aa += actuar;
            vv += vida;
            ss += saldo;
            ii += intentos;
            if string_count("E", item) > 0 { esc++; }
            if string_count("T", item) > 0 { tra++; }
            if string_count("G", item) > 0 { gor++; }
            if estado == me_guarecido { gua++; }
            break;
        case mt_invasor:
            inv++;
            ivv += vida;
            if string_count("E", item) > 0 { iesc++; }
            break;
        case mt_sabio:
            sab++;
            sii += intentos;
            if string_count("G", item) > 0 { sgor++; }
            break;
        case mt_vendedor:
            ven++;
            vss += saldo;
            if string_count("T", item) > 0 { vtra++; }
            break;
        case mt_fugado:
            if retorno != o_control.nombre_jugador and retorno != "" {
                fug1++; }
            else {
                fug2++; }
            break;
        default:
            otr++;
            break; } } }
var txt = string(floor(get_timer() / m_seg)) + sep;
txt += string(o_control.dinero_actual) + sep;
txt += string(o_control.dinero_deuda) + sep;
txt += string(ciu) + sep;
txt += string(ss) + sep;
txt += string(ii) + sep;
txt += string(aa) + sep;
txt += string(vv) + sep;
txt += string(esc) + sep;
txt += string(tra) + sep;
txt += string(gor) + sep;
txt += string(gua) + sep;
txt += string(inv) + sep;
txt += string(ivv) + sep;
txt += string(iesc) + sep;
txt += string(sab) + sep;
txt += string(sii) + sep;
txt += string(sgor) + sep;
txt += string(ven) + sep;
txt += string(vss) + sep;
txt += string(vtra) + sep;
txt += string(fug1) + sep;
txt += string(fug2) + sep;
txt += string(otr);
file_text_write_string(ff, txt);
file_text_writeln(ff);
file_text_close(ff); }

