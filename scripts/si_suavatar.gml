// arg0: nombre de jugador en memoria
// arg1: id de avatar a guardar, o -1
// ret: id de avatar guardado o hallado si arg1 -1

var res = irandom(m_avatares - 1);
with o_control {
    if argument1 == -1 {
        if is_array(lascaritas) {
            for (var i = 0; i < array_height_2d(lascaritas); i++) {
                if lascaritas[i, 1] == argument0 {
                    res = lascaritas[i, 0];
                    break; } } } }
    else {
        res = argument1;
        if is_array(lascaritas) {
            var ok = false;
            for (var i = 0; i < array_height_2d(lascaritas); i++) {
                if lascaritas[i, 1] == argument0 {
                    lascaritas[i, 0] = argument1;
                    ok = true;
                    break; } }
            if !ok {
                var n = array_height_2d(lascaritas);
                lascaritas[n, 0] = argument1;
                lascaritas[n, 1] = argument0; } }
        else {
            lascaritas[0, 0] = argument1;
            lascaritas[0, 1] = argument0; } } }
return res;

