// buscar construccion al azar
// arg0: id de quien llama

var res;
var i = 0;
with o_bloque {
    if estado != ms_muerto and tipo != mi_arbol and tipo != mi_piedra {
        res[i] = id;
        i++; } }
if i == 0 {
    argument0.metax = argument0.x;
    argument0.metay = argument0.y; }
else {
    var xx, yy, marg;
    res = res[irandom(i - 1)];
    i = random(360);
    marg = random(mq_margen);
    xx = res.x + lengthdir_x(si_radio(res.tipo) + mu_radio * 2 + marg, i);
    yy = res.y + lengthdir_y(si_radio(res.tipo) + mu_radio * 2 + marg, i);
    argument0.metax = xx;
    argument0.metay = yy; }

