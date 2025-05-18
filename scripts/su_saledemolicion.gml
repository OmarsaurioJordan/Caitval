// sacar unidades de edificio demolido o explotado

with o_unidad {
    if estado == me_guarecido {
        if si_mibloque(id) == noone {
            estado = me_andar; } } }

