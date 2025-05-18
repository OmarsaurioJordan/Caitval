// arg0: identificador de tipo de edificio
// ret: cuanto cuesta

var costo = 0;
switch argument0 {
    case mi_casa: costo = si_requisitos(mj_casa, 0, false); break;
    case mi_edificio: costo = si_requisitos(mj_casa, 0, false) * 3; break;
    case mi_pozo: costo = si_requisitos(mj_pozo, 0, false); break;
    case mi_molino: costo = si_requisitos(mj_pozo, 0, false) * 3; break;
    case mi_fuerte: costo = si_requisitos(mj_fuerte, 0, false); break;
    case mi_torre: costo = si_requisitos(mj_fuerte, 0, false) * 3; break;
    case mi_templo: costo = si_requisitos(mj_templo, 0, false); break;
    case mi_planetario: costo = si_requisitos(mj_templo, 0, false) * 3; break; }
return costo;

