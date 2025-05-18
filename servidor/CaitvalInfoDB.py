# Obtiene informacion servidor HTTP para el videojuego Caitval
# por Omarsaurio 2019

# importar librerias necesarias
import requests
import sys

# primero se pedira la ip y puerto a conectar
print("***Informacion Servidor Caitval***\nby Omarsaurio")
print("Digite la IP y Puerto (127.0.0.1:puerto):")
dir_ip = sys.stdin.readline().replace("\n", "")
try:
    data = "?|?|93|0|0|?"
    print("Enviando: " + data)
    msj = {"msj": data}
    res = requests.get("http://" + dir_ip +
                       "/cgi-bin/CaitvalDB.py", params=msj)
    txt = res.text
    if txt.count("|") == 5:
        txt = txt.replace("1$?|?|93|", "").replace("$", "")
        vec = txt.split("|")
        print("Mensajes: " + vec[1])
        print("Usuarios: " + vec[0])
        if int(vec[0]) > 0:
            usu = vec[2].split(",")
            for u in usu:
                print("- " + u)
    else:
        print("Invalido")
except:
    print("Error")
