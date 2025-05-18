// buscar web oficial si no la hay

with o_menu {
    if o_control.servidor == "" {
        ini_open("configuracion.ini");
        o_control.servidor = ini_read_string("config", "servidor", "");
        ini_close();
        if o_control.servidor == "" {
            o_control.servidor = "http://www.omwekiatl.xyz"; }
        keyboard_string = o_control.servidor; } }

