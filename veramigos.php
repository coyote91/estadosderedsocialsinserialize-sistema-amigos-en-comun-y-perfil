<?php
mysql_connect("localhost", "root", "");
mysql_select_db("networksocial");
include ("conexionamigos.php");


echo " <a style=' position:relative; margin: 180px 0px 0px 70px; ' href='index.php'>Regresar</a>";

$amistad = new Solicitudamistad ();
$amistad->ventanamodal();
$amistad->contaramigos();
$amistad->listaramigos ();
@$amistad->borraramigo($borrar);






?>