// ret: verdadero si hallo a alguien
// arg0: id quien llama y buscara blanco para comprarle

var ret = false;
if (argument0.tipo == mt_ciudadano or argument0.tipo == mt_turista) and
        argument0.saldo > 0 and random(1) < m_probact {
    var cercania = mu_vision;
    var quien = noone;
    var tmp;
    with o_unidad {
        if estado != me_muerto and tipo == mt_vendedor and saldo > 0 {
            tmp = point_distance(x, y, argument0.x, argument0.y);
            if tmp <= cercania {
                cercania = tmp;
                quien = id; } } }
    if quien != noone {
        argument0.estado = me_objetivo;
        argument0.blancox = quien.x;
        argument0.blancoy = quien.y;
        ret = true; } }
return ret;

