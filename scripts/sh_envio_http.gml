// arg0: tipo (int)
// arg1: receptor (str)
// arg2: emisor (str)
// arg3: cantidad (int)
// arg4: limitepro (int)
// arg5: dinero (int)
// arg6: texto (str)
// ret: id de envio para checkeo

var txt = string_replace_all(string_replace_all(argument6, "|", ""), "#", "");
var msj = string(argument0) + "|" +
    argument1 + "|" + argument2 + "|" +
    string(argument3) + "|" + string(argument4) + "|" +
    string(argument5) + "|" + txt;
var http = http_get(o_control.servidor + m_fileDB + msj);
// show_message_async(msj);
return http;

