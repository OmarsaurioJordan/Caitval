// ret: radio de la construccion
// arg0: identificador de tipo de construccion

var res = 1;
switch argument0 {
    case mi_piedra: res = 26; break;
    case mi_arbol: res = 18; break;
    case mi_casa: res = 40; break;
    case mi_edificio: res = 40; break;
    case mi_pozo: res = 50; break;
    case mi_molino: res = 50; break;
    case mi_fuerte: res = 42; break;
    case mi_torre: res = 42; break;
    case mi_templo: res = 47; break;
    case mi_planetario: res = 47; break; }
return res;

