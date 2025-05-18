// trata de comprarle a un vendedor
// arg0: id quien llama

if argument0.saldo > 0 and (argument0.tipo == mt_ciudadano or
        argument0.tipo == mt_turista) {
    var blanco = noone;
    with o_unidad {
        if estado != me_muerto and tipo == mt_vendedor and saldo > 0 {
            if point_distance(x, y, argument0.x, argument0.y) <= mu_radio * 5 {
                blanco = id;
                break; } } }
    if blanco != noone {
        var lit = 1;
        if string_count("T", blanco.item) != 0 {
            lit = 0.8; }
        if blanco.saldo <= argument0.saldo * lit {
            argument0.saldo = max(0, argument0.saldo * lit - blanco.saldo);
            blanco.saldo = 0; }
        else {
            blanco.saldo = max(0, blanco.saldo - argument0.saldo * lit);
            argument0.saldo = 0; }
        if blanco.saldo == 0 {
            blanco.estado = me_retirada; } } }

