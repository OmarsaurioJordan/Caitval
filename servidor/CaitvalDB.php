<?php
// Codigo php administrador de bases de datos para el videojuego
// Caitval, por Omarsaurio 2019, este archivo debe llamarse
// "CaitvalDB.php" y la informacion se pasa con "?msj=" en la url

// estructura mensajes
// tipo|receptor|emisor|cantidad|limitepro|dinero|texto
// int |str     |str   |int     |int      |int   |str
// para multiples mensajes
// mensaje1#mensaje2#mensaje...#mensajefinal
// trama   #trama   # trama    #trama
// caracteres reservados: |, # (solo logistica)

// estructura partidas
// nombre,avatar,codigo,actividad,edad,actualizar,listar,espro
// str   ,int   ,int   ,datetime ,int ,bool,     ,bool  ,bool

// tipos de envios de usuarios
// 0 - retorno (cuando unidades regresan de mision)
// 1 - informe (espionaje)
// 2 - carta, 3 - invasion, 4 - defensa, 5 - asedio
// 6 - regalo, 7 - venta, 8 - robo, 9 - migrantes
// 10 - persuacion, 11 - espionaje, 12 - colaboracion
// tipos de envios administrativos
// 93 - informacion (general sobre partidas y mensajes)
// 94 - destruir (peticion para limpiar tablas)
// 95 - listado (nombres de usuarios para interactuar)
// 96 - okey, 97 - error
// 98 - atencion (usuario pregunta por mensajes pendientes)
// 99 - conexion (usuario inicia o reinicia partida)

// estructura de envio de usuarios, tipo 95
// a:avatar, n:nombre, orden segun actividad, edad >= minedad
// a0,n0,a1,n1,a2,n2,a3,n3

// para destruir las tablas:
// direccionweb + /CaitvalDB.php?msj=94||||||paswdestroy

// errores
// 0 - desconocido, error generico
// 1 - version, no coincide con servidor
// 2 - duplicado, hay otro nombre igual
// 3 - muerto, ya ha perdido la partidas
// 4 - trampa, intento de recomenzar partida vieja
// 5 - antiguo, pertenece a partida anterior
// 6 - inexistente, intento de envio a no registrado
// 7 - cadaver, intento de envio a muerto
// 8 - pendiente, jugador aun no recibe mensaje anterior
// 9 - registrar, no esta registrado
// 10 - denegado, falso password de destruccion

// okeys
// 0 - conexion, conecto adecuadamente
// 1 - mensaje, enviado adecuadamente
// 2 - vacio, sin mensajes para usted
// 3 - destruido, tablas fueron limpiadas

// constantes del juego
$version = '1.1.2';
$minedad = 5; // 10 edad para entrar en conflicto
$maxusr = 300; // 100 maxima lista de usuarios retornada
$ciclo = 25; // 30 seg duracion ciclo del juego
$mostrarlo = 86400; // 86400 seg mostrar al jugador en lista
$elimuerto = 259200; // 259200 seg eliminar muerto de registro
$eliminact = 518400; // 518400 seg eliminar inactivo de registro
$volversepro = 720; // 720 min para volverse pro si activo
$blockantik = true; // true bloquear partida antigua
$paswdestroy = 'avadakedavra'; // pasword para destruir tablas

// datos de conexion y servidor
$server = 'localhost';
$username = 'u630689278_omi';
$password = '10382393744IngElectronica';
$database = 'u630689278_games';

function servicio()
{
	global $server, $username, $password, $database;
	// hacer la conexion con el servidor
	$conexion = mysqli_connect($server, $username, $password);
	if (!$conexion)
	{
		echo '97|||0|||Servidor';
		exit;
	}
	if (!mysqli_select_db($conexion, $database))
	{
		echo '97|||0|||Database';
		mysqli_close($conexion);
		exit;
	}
	// obtener informacion entrante (mensaje)
	$respuesta = "";
	$param = $_GET['msj'];
	if (substr_count($param, '|') == 6)
	{
		// depurar segun tipo de mensaje
		$msj = explode('|', $param);
		switch ($msj[0])
		{
			case '99':
				$respuesta = conectar($msj[2], $msj[3], $msj[4], $msj[5], $msj[6], $conexion);
				break;
			case '98':
				$respuesta = atender($msj[2], $msj[3], $msj[4], $conexion);
				break;
			case '94':
				$respuesta = destruir($msj[6], $conexion);
				break;
			case '93':
				$respuesta = informar($conexion);
				break;
			default:
				$respuesta = juego($msj, $conexion);
				break;
		}
	}
	// verificar que de alguna respuesta
	if ($respuesta == "")
	{
		$respuesta = '97|||0|||Desconocido';
	}
	mysqli_close($conexion);
	echo $respuesta;
}

function conectar($nombre, $codigo, $edad, $avatar, $suversion, $conexion)
{
	global $version, $minedad, $ciclo, $eliminact, $blockantik;
	$res = "";
	if ($suversion != $version)
	{
		$res = "97|||1|||Version:$version";
	}
	else
	{
		$cmb = limpiar_partidas($conexion);
		$usr = mysqli_query($conexion, "SELECT codigo, edad, espro FROM partidas WHERE nombre='$nombre'");
		if (!$usr)
		{
			$res = '97|||0|||MySql.0';
		}
		elseif (mysqli_num_rows($usr) == 0)
		{
			if ($edad > 1 and $blockantik)
			{
				$res = '97|||5|||Antiguo';
			}
			elseif ($edad == 1)
			{
				$ahora = time();
				$query = mysqli_query($conexion, "INSERT INTO partidas (nombre, avatar, codigo, edad, actividad) VALUES ('$nombre','$avatar','$codigo','$edad', '$ahora')");
				if (!$query)
				{
					$res = '97|||0|||MySql.1';
				}
				else
				{
					$res = "96||0,$minedad|0|$ciclo|$eliminact|Conexion";
					if ($edad >= $minedad)
					{
						$cmb = true;
					}
				}
			}
			else
			{
				$res = '97|||3|||Muerto';
			}
		}
		else
		{
			$data = mysqli_fetch_assoc($usr);
			if ($codigo != $data['codigo'])
			{
				$res = '97|||2|||Duplicado';
			}
			elseif ($data['edad'] == 0)
			{
				$res = '97|||3|||Muerto';
			}
			elseif ($data['edad'] > $edad)
			{
				$res = '97|||4|||Trampa';
			}
			else
			{
				$ahora = time();
				$query = mysqli_query($conexion, "UPDATE partidas SET edad='$edad', actividad='$ahora' WHERE nombre='$nombre'");
				if (!$query)
				{
					$res = '97|||0|||MySql.2';
				}
				else
				{
					$espro = $data['espro'];
					$res = "96||$espro,$minedad|0|$ciclo|$eliminact|Conexion";
					if ($edad >= $minedad)
					{
						$cmb = true;
					}
				}
			}
		}
		if ($cmb)
		{
			mysqli_query($conexion, "UPDATE partidas SET actualizar='1', listar='1' WHERE edad>=$minedad");
		}
	}
	return $res;
}

function atender($nombre, $tiempo, $edad, $conexion)
{
	global $minedad, $volversepro;
	$res = "";
	$cmb = false;
	$actu = false;
	$vivo = true;
	$usr = mysqli_query($conexion, "SELECT edad, actualizar, espro FROM partidas WHERE nombre='$nombre'");
	if (!$usr)
	{
		$res = '97|||0|||MySql.3';
	}
	elseif (mysqli_num_rows($usr) > 0)
	{
		$data = mysqli_fetch_assoc($usr);
		$newpro = $data['espro'];
		if ($tiempo >= $volversepro)
		{
			$newpro = 1;
		}
		$ahora = time();
		if ($data['edad'] < $minedad and $edad >= $minedad)
		{
			$cmb = true;
			$actu = true;
			$query = mysqli_query($conexion, "UPDATE partidas SET actividad='$ahora', edad='$edad', actualizar='0', listar='1', espro='$newpro' WHERE nombre='$nombre'");
		}
		elseif ($data['edad'] > 0 and $edad == 0)
		{
			$cmb = true;
			$vivo = false;
			$query = mysqli_query($conexion, "UPDATE partidas SET actividad='$ahora', edad='$edad', actualizar='0', listar='0', espro='$newpro' WHERE nombre='$nombre'");
		}
		elseif ($data['actualizar'] == 1)
		{
			$actu = true;
			$query = mysqli_query($conexion, "UPDATE partidas SET actividad='$ahora', edad='$edad', actualizar='0', espro='$newpro' WHERE nombre='$nombre'");
		}
		else
		{
			$query = mysqli_query($conexion, "UPDATE partidas SET actividad='$ahora', edad='$edad', espro='$newpro' WHERE nombre='$nombre'");
		}
		if (!$query)
		{
			$res = '97|||0|||MySql.4';
		}
		else
		{
			// cambiar flag actualizar en otros usuarios
			if ($cmb)
			{
				mysqli_query($conexion, "UPDATE partidas SET actualizar='1', listar='1' WHERE edad>=$minedad AND nombre!='$nombre'"); 
			}
			$res = "";
			if ($vivo and $edad >= $minedad)
			{
				if ($actu)
				{
					$li = lista_activos($conexion, $nombre);
					if ($li != "")
					{
						$res .= "95||||||$li";
					}
				}
				$pend = mysqli_query($conexion, "SELECT * FROM mensajes WHERE receptor='$nombre'");
				if ($pend)
				{
					if (mysqli_num_rows($pend) > 0)
					{
						while ($row = mysqli_fetch_assoc($pend))
						{
							$tt = $row['tipo'];
							$rr = $row['receptor'];
							$ee = $row['emisor'];
							$cc = $row['cantidad'];
							$ll = $row['limitepro'];
							$dd = $row['dinero'];
							$xx = $row['texto'];
							$res .= "#$tt|$rr|$ee|$cc|$ll|$dd|$xx";
						}
					}
					mysqli_query($conexion, "DELETE FROM mensajes WHERE receptor='$nombre'");
				}
			}
			else
			{
				mysqli_query($conexion, "UPDATE mensajes SET tipo='0', receptor=emisor, emisor='', texto='' WHERE tipo>0 AND receptor='$nombre'");
				mysqli_query($conexion, "DELETE FROM mensajes WHERE receptor='$nombre'");
			}
			if ($res == "")
			{
				$res = '96|||2|||Vacio';
			}
		}
	}
	else
	{
		$res = '97|||9|||Registrar';
	}
	return $res;
}

function destruir($supaswdestroy, $conexion)
{
	global $paswdestroy;
	$res = "";
	if ($supaswdestroy == $paswdestroy)
	{
		$queryp = mysqli_query($conexion, "DELETE FROM partidas");
		$querym = mysqli_query($conexion, "DELETE FROM mensajes");
		if ($queryp and $querym)
		{
			$res = '96|||3|||Destruido';
		}
		else
		{
			$res = '97|||0|||MySql.5';
		}
	}
	else
	{
		$res = '97|||10|||Denegado';
	}
	return $res;
}

function informar($conexion)
{
	$res = "";
	$query1 = mysqli_query($conexion, "SELECT nombre, espro FROM partidas WHERE edad>0");
	if (!$query1)
	{
		$res = '97|||0|||MySql.6';
	}
	else
	{
		$num_usu = mysqli_num_rows($query1);
		$num_pro = 0;
		$lista = "";
		if ($num_usu != 0)
		{
			while ($row = mysqli_fetch_assoc($query1))
			{
				$nn = $row['nombre'];
				$lista .= "$nn,";
				if ($row['espro'] > 0)
				{
					$num_pro += 1;
				}
			}
		}
		$query2 = mysqli_query($conexion, "SELECT tipo FROM mensajes");
		if (!$query2)
		{
			$res = '97|||0|||MySql.7';
		}
		else
		{
			$num_men = mysqli_num_rows($query2);
			$res = "93|||$num_pro|$num_usu|$num_men|$lista";
		}
	}
	return $res;
}

function juego($msj, $conexion)
{
	$tipo = $msj[0];
	$receptor = $msj[1];
	$emisor = $msj[2];
	$cantidad = $msj[3];
	$limitepro = $msj[4];
	$dinero = $msj[5];
	$texto = $msj[6];
	$res = "";
	$usr = mysqli_query($conexion, "SELECT edad FROM partidas WHERE nombre='$receptor'");
	if (!$usr)
	{
		$res = '97|||0|||MySql.8';
	}
	elseif (mysqli_num_rows($usr) == 1)
	{
		$data = mysqli_fetch_assoc($usr);
		if ($data['edad'] == 0)
		{
			$res = '97|||7|||Cadaver';
		}
		else
		{
			$pend = mysqli_query($conexion, "SELECT tipo FROM mensajes WHERE receptor='$receptor' AND emisor='$emisor'");
			if (!$pend)
			{
				$res = '97|||0|||MySql.9';
			}
			elseif (mysqli_num_rows($pend) > 0)
			{
				$res = '97|||8|||Pendiente';
			}
			else
			{
				$query = mysqli_query($conexion, "INSERT INTO mensajes (tipo, receptor, emisor, cantidad, limitepro, dinero, texto) VALUES('$tipo', '$receptor', '$emisor', '$cantidad', '$limitepro', '$dinero', '$texto')");
				if ($query)
				{
					$res = '96|||1|||Mensaje';
				}
			}
		}
	}
	else
	{
		$res = '97|||6|||Inexistente';
	}
	return $res;
}

function limpiar_partidas($conexion)
{
	global $elimuerto, $eliminact;
	$cmb = false;
	$ahoram = time() - $elimuerto;
	$ahorav = time() - $eliminact;
	$quitar = mysqli_query($conexion, "SELECT nombre, actividad, edad FROM partidas");
	if ($quitar)
	{
		$lisquitar = "";
		if (mysqli_num_rows($quitar) > 0)
		{
			while ($row = mysqli_fetch_assoc($quitar))
			{
				if (($row['edad'] == 0 and $row['actividad'] < $ahoram) or $row['actividad'] < $ahorav)
				{
					$nn = $row['nombre'];
					$lisquitar .= "'$nn', ";
				}
			}
		}
		$query = mysqli_query($conexion, "DELETE FROM partidas WHERE nombre IN ($lisquitar'')");
		if ($query)
		{
			$cmb = true;
			mysqli_query($conexion, "UPDATE mensajes SET tipo='0', receptor=emisor, emisor='', texto='' WHERE tipo>0 AND receptor IN ($lisquitar'')");
			mysqli_query($conexion, "DELETE FROM mensajes WHERE receptor IN($lisquitar'')");
		}
	}
	return $cmb;
}

function lista_activos($conexion, $elmismo)
{
	global $minedad, $maxusr, $mostrarlo;
	$li = "";
	$ahoraa = time() - $mostrarlo;
	$gnt = mysqli_query($conexion, "SELECT nombre, avatar FROM partidas WHERE nombre!='$elmismo' AND edad>=$minedad AND actividad>=$ahoraa ORDER BY actividad DESC LIMIT $maxusr");
	if ($gnt)
	{
		if (mysqli_num_rows($gnt) > 0)
		{
			while ($row = mysqli_fetch_assoc($gnt))
			{
				$aa = $row['avatar'];
				$nn = $row['nombre'];
				$li .= "$aa,$nn,";
			}
		}
	}
	return $li;
}

servicio();
?>