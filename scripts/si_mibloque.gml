// ret: id del bloque en el cual se ha guarecido
// arg0: id de quien llama

var res = noone;
with o_bloque {
    if estado != ms_muerto and x == argument0.x and y == argument0.y {
        res = id;
        break; } }
return res;

