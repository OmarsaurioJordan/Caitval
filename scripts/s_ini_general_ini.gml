// carga configuraciones iniciales

ini_open("configuracion.ini");
o_control.idapp = 1 + irandom(m_codigounico);
ini_write_string("config", "idapp", string(o_control.idapp));
o_control.servidor = ini_read_string("config", "servidorx", "");
switch os_get_language() {
    case "es":
        o_control.idioma = real(ini_read_string("config", "idioma", string(m_es))); break;
    default:
        o_control.idioma = real(ini_read_string("config", "idioma", string(m_en))); break; }
o_control.sonido = real(ini_read_string("config", "sonido", string(m_musica)));
ini_close();

