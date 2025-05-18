// define si se pondra en modo accion o evasion
// arg0: id quien llama

if tipo == mt_ciudadano or tipo == mt_turista {
    var dens = 0;
    with o_unidad {
        if estado != me_muerto and random(1) > 0.666 - 0.333 * actuar {
            if tipo == mt_ciudadano or tipo == mt_turista {
                if point_distance(x, y, argument0.x, argument0.y) < mu_vision {
                    dens++; } } } }
    if dens / mu_muchos < random(1) {
        argument0.actuar = 0; }
    else if argument0.vida / mu_vida > random(1) {
        argument0.actuar = 1; }
    else {
        argument0.actuar = 0; } }

