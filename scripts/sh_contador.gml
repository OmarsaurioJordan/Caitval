//poner esto al iniciar el juego
//arg0: true si es descargas, false si es poseto

if os_is_network_connected()
{
    ini_open("configuracion.ini");
    if argument0
    {
        if !ini_key_exists("config", "instalado")
        {
            ini_write_string("config", "instalado", "1");
            http_get(official_web + "/mysql_omarsauriogames.php?ff=si&game=caitval&version=?&jugadores=?&puntajes=?&descargas=?&ac=?");
        }
    }
    else
    {
        if !ini_key_exists("config", "poseto")
        {
            ini_write_string("config", "poseto", "1");
            http_get(official_web + "/mysql_omarsauriogames.php?ff=sc&game=caitval&version=?&jugadores=?&puntajes=?&descargas=?&ac=?");
        }
    }
    ini_close();
}

