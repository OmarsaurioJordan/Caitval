# Simulador de conexion HTTP para el videojuego Caitval
# por Omarsaurio 2019

# importar librerias necesarias
import requests
import sys
import numpy as np

# informacion de tipo de envios
info = "Tipo de Envios:\n" \
       "99 conexion\n" \
       "98 atencion\n" \
       "94 destruir DB\n" \
       "93 informacion\n" \
       "0 retorno, 1 invasion, 2 proteccion\n" \
       "3 asedio, 4 monedas, 5 prestamo\n" \
       "6 robo, 7 migrantes, 8 persuacion\n" \
       "9 espionaje, 10 colaboracion, 11 carta\n" \
       "Tipo de Respuesta:\n" \
       "97 error, 96 okey, 95 listado jugadores"

# primero se pedira la ip y puerto a conectar
print("***Simulacion de Conexion de Caitval***\nby Omarsaurio")
print("Digite la IP y Puerto (127.0.0.1:puerto):")
dir_ip = sys.stdin.readline().replace("\n", "")
print("Comenzara el Ciclo de Envio:\n")

def blabla():
    res = "abcde"
    return res

# main loop del algoritmo, para enviar diversos mensajes
while True:

    # pedira los campos necesarios para un mensaje
    print("\nDigite el tipo de mensaje (i info, x salir, w servidor):")
    tipo = sys.stdin.readline().replace("\n", "").lower()

    # depuracion segun tipo
    data = ""
    if tipo == "i":
        print(info)
    elif tipo == "x":
        print("Saliendo")
        break
    elif tipo == "w":
        print("Digite la IP y Puerto (127.0.0.1:puerto):")
        dir_ip = sys.stdin.readline().replace("\n", "")
        print("Comenzara el Ciclo de Envio:\n")
    elif int(tipo) <= 11:
        print("Digite el Receptor del Mensaje")
        emi = sys.stdin.readline().replace("\n", "")
        print("Digite el Emisor del Mensaje")
        rec = sys.stdin.readline().replace("\n", "")
        data = rec + "|" + emi + "|" + tipo + "|" +\
            str(np.random.randint(9)) + "|" +\
            str(np.random.randint(9)) + "|" + blabla()
    elif tipo == "99":
        print("Digite el Nombre para Conexion")
        nam = sys.stdin.readline().replace("\n", "")
        print("Digite el Codigo para Conexion")
        cod = sys.stdin.readline().replace("\n", "")
        print("Digite la Edad para Conexion")
        eda = sys.stdin.readline().replace("\n", "")
        print("Digite la Version para Conexion")
        ver = sys.stdin.readline().replace("\n", "")
        data = "?|" + nam + "|99|" + cod + "|" + eda +\
            "|" + ver
    elif tipo == "98":
        print("Digite el Nombre para Atencion")
        nam = sys.stdin.readline().replace("\n", "")
        print("Digite la Edad para Atencion")
        eda = sys.stdin.readline().replace("\n", "")
        data = "?|" + nam + "|98|0|" + eda + "|?"
    elif tipo == "94" or tipo == "93":
        data = "?|?|" + tipo + "|0|0|?"

    # intentara hacer el envio del mensaje
    if data != "":
        try:
            print("Enviando: " + data)
            msj = {"msj": data}
            res = requests.get("http://" + dir_ip +
                               "/cgi-bin/CaitvalDB.py", params=msj)
            print("Recibido: " + res.text)
        except:
            print("Error")
