// ret: verdadero si llego al punto
// arg0: id de quien llama, hara calculos de trslacion
// arg1, arg2: punto x,y deseado

var ret = false;
with argument0 {
    var normal = su_rebotar(id);
    if point_distance(x, y, argument1, argument2) > mu_radio * 2 {
        var dd = point_direction(x, y, argument1, argument2);
        var vv = 1;
        if saldo > mu_saldo_porc * m_dolar * 2.5 {
            vv = 0.8; }
        if normal != -1 {
            dd = normal - sign(angle_difference(normal, dd)) * 40; }
        x += lengthdir_x(mu_velocidad * min(delta_time, m_dtlim) * vv, dd); 
        y += lengthdir_y(mu_velocidad * min(delta_time, m_dtlim) * vv, dd); }
    else if normal != -1 {
        x += lengthdir_x(mu_velocidad * min(delta_time, m_dtlim), normal); 
        y += lengthdir_y(mu_velocidad * min(delta_time, m_dtlim), normal); }
    else {
        ret = true; } }
return ret;

