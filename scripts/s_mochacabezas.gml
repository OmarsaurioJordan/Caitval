// elimina posibles falsas cabezas en edificios

var myid, gugu;
with o_bloque {
    if estado != ms_muerto and guarecidos != 0 {
        myid = id;
        gugu = 0;
        with o_unidad {
            if estado != me_muerto and x == myid.x and y == myid.y {
                gugu++; } }
        guarecidos = gugu; } }

