# Manejador de bases de datos para el videojuego Caitval
# por Omarsaurio 2019

# para crear el servidor:
# ubicar la consola de comandos con cd path
# path: directorio del servidor con carpeta cgi-bin dentro y este script dentro
# python -m http.server --cgi puerto
# puerto: el deseado, 80 es http, otro ejemplo es 3069

# estructura de los mensajes:
# receptor, emisor, tipo msj, valor1, valor2, extra info
# str|str|int|int|int|str
# para respuestas, se agrega un indicador de numero de mensajes
# numero de msj, mensaje 1, mensaje 2, mensaje 3, etc...
# int$msj$msj$msj$...$
# str vacios como ?, int vacios como 0
# caracteres reservados: ?, |, $, %, \n

# tipos de mensajes:
# 0 retorno, 1 invasion, 2 proteccion, 3 asedio
# 4 monedas, 5 prestamo, 6 robo, 7 migrantes
# 8 presuacion, 9 espionaje, 10 colaboracion, 11 carta
# 99 conexion, 98 atencion, 97 error, 96 okey
# 95 listado, 94 destruir, 93 informacion

# tipos de error:
# Desconocido, si no se hallo nada que responder
# Version, no coincide con la ultima version del juego
# Duplicado, hay otro jugador con el mismo nombre
# Muerto, ya ha perdido la partida
# Trampa, intento de recomenzar partida vieja, menor edad
# Antiguo, el jugador pertenece a partida anterior
# Inexistente, intento de envio de mensaje a no registrado
# Cadaver, intento de envio de mensaje a muerto
# Pendiente, el jugador aun no recibe tu anterior mensaje
# Registrar, el jugador no esta en la lista

# tipos de okey:
# Conexion, se conecto adecuadamente
#   envia segundos del ciclo y tiempo maximo para abandono
# Mensaje, se recibio bien el mensaje
# Vacio, sin mensajes para usted

# estructura base datos usuarios:
# codigo, nombre, actividad, edad, actualizado
# int,    str,    datetime,  int,  bool(0-1)

# estructura base datos mensajes:
# receptor, emisor, tipo msj, valor1, valor2, extra info
# str,      str,    int,      int,    int,    str

# otra variable a guardar persistentemente:
# lista, jugadores activos (str): name,name,name,name,...,

# importar librerias necesarias
import cgi
import os
import sys
from datetime import datetime as dt

# constantes globales del juego
def const(id):
    if id == 0: # version
        res = "1.0.0"
    elif id == 1: # edad minima de conflicto
        res = 10
    elif id == 2: # segundos que dura un ciclo del juego
        res = 30
    elif id == 3: # segundos para eliminar muerto de DB
        res = 259200
    elif id == 4: # segundos para eliminar inactivo de DB
        res = 518400
    elif id == 5: # nombre archivo DB usuarios
        res = "usuarios.txt"
    elif id == 6: # nombre archivo DB mensajes
        res = "mensajes.txt"
    elif id == 7: # nombre archivo lista jugadores disponibles
        res = "lista.txt"
    elif id == 8: # nombre archivo historial de acciones
        res = "historial.txt"
    elif id == 9: # bloquear jugador antiguo
        res = True
    else: # null
        res = -1
    return res

# funcion principal
def main():

    # guardara la respuesta enviada al final
    respuesta = ""

    # para Testeo poner True y escribir entrada en consola
    if False:
        print("formato:\nstr str tipo int int str")
        param = sys.stdin.readline().replace("\n", "").replace(" ", "|")
    # obtener los parametros del mensaje recibido por HTTP
    else:
        args = cgi.FieldStorage()
        param = args["msj"].value
    if param.count("|") == 5:
        msj = param.split("|")

        # depuracion segun tipo de mensaje
        tipo = int(msj[2])
        if tipo == 99:
            respuesta = conexion(msj)
        elif tipo == 98:
            respuesta = atencion(msj)
        elif tipo == 94:
            destruirDB()
            respuesta = "1$?|?|96|0|0|Destruida$"
        elif tipo == 93:
            respuesta = informacion()
        elif tipo <= 11:
            respuesta = juego(msj)

    # enviar la respuesta
    if respuesta == "":
        respuesta = "1$?|?|97|0|0|Desconocido$"
    print("Content-type:text\n\n" + respuesta)

def destruirDB():
    for x in range(4):
        try:
            os.remove(const(5 + x))
        except:
            pass

def conexion(msj):
    # verificar version
    if msj[5] != const(0):
        res = "1$?|?|97|0|0|Version:" + const(0) + "$"
    else:
        usuarios = abrirDB(const(5))
        camb = limpiarDBs(usuarios)
        existe = -1
        for u in range(len(usuarios)):
            if usuarios[u][1] == msj[1]:
                existe = u
                break
        if existe == -1:
            if msj[4] != "1" and const(9):
                res = "1$?|?|97|0|0|Antiguo$"
            else:
                usuarios.append([msj[3], msj[1], ahora(), msj[4], "1"])
                res = "1$?|?|96|" + str(const(2)) + "|" + \
                      str(const(4)) + "|Conexion$"
                camb = True
        elif msj[3] != usuarios[existe][0]:
            res = "1$?|?|97|0|0|Duplicado$"
        elif usuarios[existe][3] == "0":
            res = "1$?|?|97|0|0|Muerto$"
        elif usuarios[existe][3] > msj[4]:
            res = "1$?|?|97|0|0|Trampa$"
        else:
            usuarios[existe][2] = ahora()
            usuarios[existe][3] = msj[4]
            usuarios[existe][4] = "1"
            res = "1$?|?|96|" + str(const(2)) + "|" +\
                  str(const(4)) + "|Conexion$"
            camb = True
        if camb:
            huboCambios(usuarios)
            guardarDB(usuarios, const(5))
    return res

def atencion(msj):
    usuarios = abrirDB(const(5))
    camb = False
    vivo = True
    actu = False
    esta = False
    for u in usuarios:
        if u[1] == msj[1]:
            u[2] = ahora()
            if int(u[3]) < const(1) and int(msj[4]) >= const(1):
                camb = True
            elif int(u[3]) > 0 and msj[4] == "0":
                camb = True
                vivo = False
            u[3] = msj[4]
            if u[4] == "1":
                actu = True
            esta = True
            break
    if esta:
        res = "%$"
        if vivo:
            n = 0
            if actu:
                li = abrirLista()
                if li != "?":
                    res += "?|?|95|0|0|" + li + "$"
                    n += 1
            num, dat = packeteMensajes(msj[1])
            res += dat
            n += num
            res = res.replace("%", str(n))
        else:
            mensajes = abrirDB(const(6))
            if limpiarUsuario(mensajes, msj[1]):
                guardarDB(mensajes, const(6))
        if camb:
            huboCambios(usuarios)
            if actu and vivo:
                for u in usuarios:
                    if u[1] == msj[1]:
                        u[4] = "0"
                        break
        guardarDB(usuarios, const(5))
        if res == "%$" or res == "0$":
            res = "1$?|?|96|0|0|Vacio$"
    else:
        res = "1$?|?|97|0|0|Registrar$"
    return res

def juego(msj):
    usuarios = abrirDB(const(5))
    existe = False
    muerto = False
    for u in usuarios:
        if u[1] == msj[0]:
            if u[3] == "0":
                muerto = True
            existe = True
            break
    if existe:
        if muerto:
            res = "1$?|?|97|0|0|Cadaver$"
        else:
            mensajes = abrirDB(const(6))
            pend = False
            for m in mensajes:
                if m[0] == msj[0] and m[1] == msj[1]:
                    pend = True
                    break
            if pend:
                res = "1$?|?|97|0|0|Pendiente$"
            else:
                mensajes.append(msj)
                guardarDB(mensajes, const(6))
                res = "1$?|?|96|0|0|Mensaje$"
    else:
        res = "1$?|?|97|0|0|Inexistente$"
    return res

def packeteMensajes(receptor):
    num = 0
    dat = ""
    camb = False
    mensajes = abrirDB(const(6))
    hallo = True
    while hallo:
        hallo = False
        for m in range(len(mensajes)):
            if mensajes[m][0] == receptor:
                dat += "|".join(mensajes.pop(m)) + "$"
                num += 1
                hallo = True
                camb = True
                break
    if camb:
        guardarDB(mensajes, const(6))
    return num, dat

def limpiarUsuario(mensajes, quien):
    sav = False
    dat = []
    hallo = True
    while hallo:
        hallo = False
        for m in range(len(mensajes)):
            if mensajes[m][0] == quien:
                dat.append(mensajes.pop(m))
                hallo = True
                sav = True
                break
    if sav:
        for d in dat:
            if int(d[2]) > 0:
                if not (d[2] == "4" or d[2] == "5"):
                    d[4] = "0"
                d[2] = "0"
                d[0] = d[1]
                d[1] = "?"
                mensajes.append(d)
    return sav

def abrirDB(archivo):
    try:
        f = open(archivo, "r")
        dat = f.readlines()
        f.close()
        res = []
        for d in dat:
            d = d.replace("\n", "")
            res.append(d.split("|"))
    except:
        res = []
    return res

def abrirLista():
    try:
        f = open(const(7), "r")
        res = f.readline().replace("\n", "")
        f.close()
        if res == "":
            res = "?"
    except:
        res = "?"
    return res

def limpiarDBs(usuarios):
    camb = False
    hoy = dt.now()
    quitar = []
    for u in range(len(usuarios)):
        t = hoy - dt.fromisoformat(usuarios[u][2])
        t = t.days * 24 * 3600 + t.seconds
        if usuarios[u][3] == "0" and t >= const(3):
            quitar.append(usuarios[u][1])
        elif t >= const(4):
            quitar.append(usuarios[u][1])
    # ahora quitarlos como tal
    if len(quitar) > 0:
        camb = True
        # primero de la tabla de usuarios
        for q in quitar:
            for u in range(len(usuarios)):
                if usuarios[u][1] == q:
                    usuarios.pop(u)
                    break
        # luego de la tabla de mensajes
        mensajes = abrirDB(const(6))
        sav = False
        for q in quitar:
            sav = limpiarUsuario(mensajes, q)
        if sav:
            guardarDB(mensajes, const(6))
    return camb

def huboCambios(usuarios):
    lista = []
    prior = []
    hoy = dt.now()
    for u in usuarios:
        u[4] = "1"
        if int(u[3]) >= const(1):
            lista.append(u[1])
            t = hoy - dt.fromisoformat(u[2])
            prior.append(t.days * 24 * 3600 + t.seconds)
    # ordenar segun tiempo activo
    if len(lista) > 0:
        orden = prior.copy()
        orden.sort()
        nombres = []
        for v in orden:
            p = prior.index(v)
            prior[p] = -1
            nombres.append(lista[p])
        dat = ",".join(nombres)
    else:
        dat = ""
    f = open(const(7), "w")
    f.write(dat)
    f.close()

def guardarDB(vector, archivo):
    dat = ""
    for d in vector:
        dat += "|".join(d) + "\n"
    f = open(archivo, "w")
    f.write(dat)
    f.close()

def ahora():
    res = str(dt.now())
    res = res.split(".")[0]
    return res

def informacion():
    usuarios = abrirDB(const(5))
    numU = str(len(usuarios))
    nombres = []
    for u in usuarios:
        nombres.append(u[1])
    lista = ",".join(nombres)
    mensajes = abrirDB(const(6))
    numM = str(len(mensajes))
    res = "1$?|?|93|" + numU + "|" + numM + "|" + lista + "$"
    return res

# instanciar la funcion principal
main()
