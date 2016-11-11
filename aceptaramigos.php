<?php
mysql_connect("localhost", "root", "");
mysql_select_db("networksocial");
include ("conexionamigos.php");

$amistad = new Solicitudamistad ();
@$amistad->mostrarsolicitudamistad($idaceptar);
@$amistad->borrarsolicitudamistad($borrar);

echo " <a style=' position:relative; margin: 180px 0px 0px 160px; ' href='index.php'>Regresar</a>";


?>