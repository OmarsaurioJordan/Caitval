// arg0, arg1: posicion x,y
// arg2: propietario
// arg3: tipo de unidad
// arg4: tipo de item a poner
// arg5: maximo de pros en mapa
// arg6: numero intentos
// arg7: numero dinero o saldo
// arg8: tiempo de la mision
// ret: id de unidad creada

var prop = o_control.nombre_jugador;
var aux = instance_create(argument0 - 1 + random(2),
    argument1 - 1 + random(2), o_unidad);
if argument2 != "" {
    prop = argument2; }
aux.propietario = prop;
aux.retorno = prop;
aux.tipo = argument3;
var num_pros = 0;
with o_unidad {
    if estado != me_muerto and estado != me_retirada and propietario == prop and
            string_count(argument4, item) != 0 and tipo = argument3 {
        num_pros++; } }
if num_pros < argument5 {
    aux.item += argument4; }
aux.intentos = argument6;
aux.saldo = argument7;
aux.reloj_mision = argument8 * m_seg;
return aux;

