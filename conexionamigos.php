<?php
@session_start();
@$session = $_SESSION["logged"];
mysql_connect("localhost", "root", "");
mysql_select_db("networksocial");
 
 echo  "<link rel='stylesheet' href='css/estilo.css' /> ";
 echo  '<link rel="stylesheet" href="css/ventanamodal.css" />';
 
  
 echo "
 
	<script type='text/javascript' src='js/ventanamodal.js'></script>
	  <script type='text/javascript' src='http://code.jquery.com/jquery-2.0.3.min.js'></script>
 
 
 ";
 
Class Solicitudamistad 
{
function ventanamodal ()

{
   echo "

<div id='fade' class='overlay' ></div>
<!-- fin base semi-transparente -->
 
<!-- ventana modal -->  
	<div id='light' class='modal'>
    	<p>Amigos en Comun <br /> <a href = 'javascript:void(0)' onclick = 'ocultareldiv() '> Cerrar ventana </a> <br /><br /> ";      

              /*  $amistad = new Solicitudamistad();			   
			   @$amistad->mostraramigosencomun($friends);	
			 */
		
	echo"	</p>
    </div>
<!-- fin ventana modal -->

	
	<!----END CAJA MODAL ---->
	

";

}
function nombreusuario ()
{ 
   
   global $session;
   
   $consulta =" SELECT username FROM site_members  WHERE id = ' ".$session." ' ";
   $query = mysql_query($consulta);
   $rows = mysql_num_rows($query);
   if ($rows > 0) 
   {
         while ($fila = mysql_fetch_array( $query) )
	       {
		        echo "Bienvenido ". $fila[ 'username' ];
		   }
	   
	   
   }

}

function contarsolicitud()
{
	
	global $session;
	
	$consulta = " SELECT count(*) sender
                  FROM friendship_requests
                  WHERE recipient = '".$session."'	
	            
	            ";
	
	$query = mysql_query($consulta);
	$row = mysql_num_rows($query);

    if($row > 0)
	{
		
		while($fila = mysql_fetch_array($query))
		{
			

		 echo	"<a  style=' position:absolute; margin:30px 0px 0px 50px; text-decoration:none; '  href='aceptaramigos.php'>";
		 echo   " <span>Ver</span> <strong style='color:red;'>".$fila['sender']."</strong> <span> Solicitudes de Amistad </span> </a> <br /> ";
		}
		  
		
		
	}
	
	
}


function mostrarsolicitudamistad()
{
  
	global $session;
   
// Sección para mostrar las solicitudes de amistad
  $query = mysql_query("SELECT * FROM friendship_requests WHERE recipient = '" .$session. "'");
  if(mysql_num_rows($query) > 0) {
    while($row = mysql_fetch_array($query)) { 
      $_query = mysql_query("SELECT * FROM site_members WHERE id = '" . $row["sender"] . "'");
      while($_row = mysql_fetch_array($_query)) 
	  {
      
echo "  <strong> ". $_row["username"] . " </strong>quiere ser tu amigo. <a  class='botonaceptar'  href=\"" .$_SERVER["PHP_SELF"]."?accept=" . $_row["id"] . "\">Confirmar la solicitud</a><br />";
    
		echo "  <a class='botoneliminar' href=\" " . $_SERVER["PHP_SELF"] . "?borrar=" . $_row["id"] . "\">Eliminar</a>  <br />";	
  // Sección de aceptar solicitudes de amistad
  
  @$idaceptar = $_GET["accept"];
  
  if(isset($idaceptar)) 
  {
      $amistad = new Solicitudamistad ();
      $amistad->aceptarsolicitudamistad($idaceptar);
	 
  }
//END SECCION ACEPTAR SOLICITUD AMISTAD



           /******************* BORRAR SOLICITUD AMISTAD ***********************/
     @$borrar = $_GET["borrar"];     
if(isset($borrar)) 
 {
                            
	$amistad = new Solicitudamistad();
    $amistad->borrarsolicitudamistad($borrar);
 }

           /*****************END BORRAR SOLICITUD AMISTAD ************************/
	  }
    }
  }
  

   
   
//END SECCION PARA MOSTRAR SOLICITUD AMISTAD
}

function borrarsolicitudamistad ($borrar)
{
	global $session;
	
   mysql_query("DELETE FROM friendship_requests WHERE sender = '" . $borrar . "' AND recipient = '" . $session. "'");
	
	
}




function aceptarsolicitudamistad ($idaceptar)
{
	global $session;
  
	
	$query = mysql_query("SELECT * FROM friendship_requests WHERE sender = '" . $idaceptar . "' AND recipient = '" . $session. "'");
    if(mysql_num_rows($query) > 0) 
    {
           
       /** AÑADO AMIGO A TABLA AMIGOS REFERECIA 1  !IMPORTANTE***/         
   $aceptado_uno = mysql_query( "INSERT INTO amigos (usuario, amigos) values ( '" .$session. "' , '" .$idaceptar. "' ) " );
	
	if(!$aceptado_uno)
	 {
	 	
		echo "Hay un problema con la consulta aceptado_uno ";
		
	 }
	else
	{

        $consultaid = "SELECT id 
                          FROM amigos
                          WHERE usuario = ".$session." AND amigos = ".$idaceptar." ";

$queryconsultaid = mysql_query($consultaid) or die("error en la consulta queryconsultausuariosession");
$rowconsultaid = mysql_num_rows($queryconsultaid) or die ("error en la consulta rowconsultausuariosession");
if($rowconsultaid > 0)
{
	while($filaconsultaid = mysql_fetch_array($queryconsultaid))
	{
				
			$id = $filaconsultaid['id']; 
			
	$elevento = "aceptado";

   date_default_timezone_set('America/Bogota');
   $hora = date("H:i:S A ", time());
   $fecha = date("Y/m/d " , time());
		
            $insertconsultaid = "
                        INSERT INTO newsfeed(evento, usuario, hora, fecha, codigoevento) 
                        values ('".$elevento."' , '".$session."' , '".$hora."' , '".$fecha."' , '".$id."' )
                         ";
						 
		     $queryinsertconsultaid = mysql_query($insertconsultaid);
						 
						 if(!$queryinsertconsultaid)
						 {
						 	echo "Insercion usuariosession ha fallado ". $filaconsultaid['id']."<br />";
						 }
                    
   }
	
}
else 
{
	echo "fila vacia - consulta rowconsultausuriosession o sino hay error <br />";
	
}
					  
			
} /*END ELSE ACEPTADO UNO*/

		

			 /*******************/
			 /***OPERACION 2 ****/
	 
   /** AÑADO AMIGO A TABLA AMIGOS REFERENCIA 2 !IMPORTANTE **/  				
				
     $aceptado_dos = mysql_query("INSERT INTO amigos (usuario,amigos) values ( '" .$idaceptar. "' , '" .$session. "' ) ");
     /***********/
	 
	
}//END PRINCIPAL IF  !IMPORTANTE
		
	/**** IMPORTANTE BORRA AL FINAL DE ACEPTAR SOLICITUD LA SOLICITUD CUANDO SON AMIGOS ****/
 mysql_query("DELETE FROM friendship_requests WHERE sender = '" .$idaceptar. "' AND recipient = '" .$session. "'");
    /**********/
} // END FUNCTION ACEPTAR SOLICITUD AMISTAD

                                            
                 
	









function listarmiembros ()
 { 
 
  
  global $session;

//Sección para mostrar la lista de miembros
  echo "<h2 style='postion:relative; margin-top:50px; '>Lista de Miembros:</h2>";
  $query = mysql_query("SELECT * FROM site_members  WHERE id != '" .$session. "'");
  while($row = mysql_fetch_array($query)) 
  {
    $yaamigo = false;
       	  $amigo = mysql_query("SELECT amigos FROM amigos WHERE usuario = '" .$session. "'");
          while($rowamigo = mysql_fetch_array($amigo)) 
          {
       	  
                @$friends = $rowamigo["amigos"];
                    if(isset($friends[0])) 
                    {
                      /* foreach($friends as $friend) 
                        {*/
                           if($friends == $session)
		                       {
		                           $yaamigo = true;	
		                       } 
          
                       /* }//END FOREACH*/
                   }//END IF
		  
		}//END 2 WHILE
		  
    echo @$row["username"];
    $_query = mysql_query("SELECT * FROM friendship_requests WHERE sender = '" .$session. "' AND recipient = '" .$row["id"]. "'");
    if(mysql_num_rows($_query) > 0) 
	{
       echo " - solicitud de amistad enviada.";
    } 
	elseif($yaamigo == false ) 
	     { 
            echo " - <a href=\"".$_SERVER["PHP_SELF"]."?add=".$row["id"]. "\">Agregar como amigo</a>";
	       //Sección para agregar amigo
              @$add = $_GET["add"];
              if(isset($add)) 
			  {
               $amistad = new Solicitudamistad();
			   $amistad->agregarusuario($add);
			        
              }//END SECCION AGREGAR AMIGOS
         } 

	  
	    else {
               echo " - Ya son amigos.";
              }	
		
			   
	/*else 
		{
			
	
	    $_queryamigo = mysql_query("SELECT amigos FROM amigos WHERE usuario = '" .$session. "' AND amigos = '" .$row["id"]. "'");
           if(mysql_num_rows($_queryamigo) > 0) 
	      {
            echo " - ya son amigos.";
         } 
	   
	   	}*/
			
    echo "<br />";
	
	 } //END  1 WHILE

}//END FUNCTION

function agregarusuario($add)
{
	global $session;
	     $query = mysql_query("SELECT id FROM site_members WHERE id = ' " . $add . " '   ");
          if(mysql_num_rows($query) > 0) 
		{
           $_query = mysql_query("SELECT * FROM friendship_requests WHERE sender = ' " . $session . " ' AND recipient = ' " . $add . " '  ");
           if(mysql_num_rows($_query) == 0) 
		    {
              mysql_query("INSERT INTO friendship_requests SET sender = ' " . $session . " ' , recipient = ' " . $add .  " '   ");
			  
			  /***INSERCION TABLA NEWSFEED ****/
			  
               date_default_timezone_set('America/Bogota');
               $hora = date("H:i:S A ", time());
               $fecha = date("Y/m/d " , time());
	
			  
			  $evento = "envio";
		
			  $insertevento = "INSERT INTO newsfeed (evento,usuario,hora,fecha, recipient ) values('".$evento."', '".$session."', '".$hora."', '".$fecha."' ,'".$add."')";
	
				mysql_query($insertevento);
				
			  }
			  
			 /**********END INSERCION TABLA NEWSFEED ***/ 
			  
         } // END PRIMER IF
         

}//END FUNCTION AGREGAR USUARIO 


function contaramigos ()
{
	
	global $session;
	
	$consultaconteo = "SELECT count(*) amigos 
	                   FROM amigos
	                   WHERE usuario = '".$session."' ";
	
	$queryconteoamigos = mysql_query($consultaconteo);
  
    $rowconteo = mysql_num_rows($queryconteoamigos);
	
	if($rowconteo > 0 ) 
	{
		
		  
		while ($filasconteoamigos = mysql_fetch_assoc ($queryconteoamigos))
		{
		
		echo "<p  style='text-decoration:none;  position:absolute;   margin:10px 0px 0px 370px '>";	
	     echo	"<a  style=' position:relative; margin:20px 0px 0px 50px; text-decoration:none; '  href='veramigos.php'>";
		 echo   " <span>Amigos</span> <strong style='color:red;'>".$filasconteoamigos['amigos']."</strong>  </a> <br / > </p>  ";
			
			
		}
	}
	
}




function listaramigos ()
{
 
   global $session;
   

   
//Lista de amigos de inicio ====== Friends list start
  echo "<h2>Lista amigos:</h2>";

    echo "<div style='width:590px; height:auto; background-color:beige; position:relative; margin: 0 auto;'> "; 
  
  
   
 
 $registros = 6;
 @$pagina = $_GET['pagina'];
if (!isset($pagina))
{
   $pagina = 1;
   $inicio = 0;
}
  else 
 {
   $inicio = ($pagina-1) * $registros;
 } 
  
   $consulta =  " SELECT amigos FROM amigos WHERE usuario = " . $session . " " ;
    $consulta .= " ORDER BY id ASC LIMIT ".$inicio." , ".$registros." ";
  
   $query = mysql_query($consulta) or die ("error en la consulta listar amigos # 1");
   
  
  
$contar = "SELECT * FROM amigos ";
$contarok = mysql_query($contar);
$total_registros = mysql_num_rows($contarok);
$total_paginas = ($total_registros / $registros);
  


  
  while($row = mysql_fetch_array($query)) {
    $friends = $row['amigos']."<br />";
    
    if(isset($friends[0])) {
    /* foreach($friends as $friend) {*/
        $_query = mysql_query("SELECT * FROM site_members WHERE id = '" . $friends . "'");
        $_row = mysql_fetch_array($_query);
          
		  
		    echo "<div style='position:relative; margin-top:10px; width:300px; height:90px; border:1px solid #ccc;'>";  
		    echo " - <a class='nombreamigo' href=\"perfil.php?usuario=".$_row["id"]." \"> ".$_row["username"]."  </a>  <br /> ";
			
			echo "  <a class='botoneliminaramigo' href=\" " . $_SERVER["PHP_SELF"] . "?borraramigo=" . $_row["id"] . "\">";
			echo "Eliminar  Amigo </a>  <br />";	
			
			   $amistad = new Solicitudamistad();
			   @$amistad->conteoamigosencomun( $friends);
			   @$amistad->mostraramigosencomun($friends);
			$amistad->amigosencomun();
		    
			echo "</div>";
			
			@$borrar = $_REQUEST['borraramigo'];
			    
			
			
			 if(isset($borrar))
	         {
		       $amistad = new Solicitudamistad();
			   $amistad->borraramigo($borrar);
			 }
			
      /*} //END FOREACH*/
    }
  } // END 1 WHILE
  
  echo "<center  '><p>";

   echo "";

if($total_registros>$registros){
if(($pagina - 1) > 0) {
echo "<span><a href='?pagina=".($pagina-1)."'>&laquo; Anterior</a></span> ";
}
// Numero de paginas a mostrar
$num_paginas=6;
//limitando las paginas mostradas
$pagina_intervalo=ceil($num_paginas/2)-1;
 
// Calculamos desde que numero de pagina se mostrara
$pagina_desde=$pagina-$pagina_intervalo;
$pagina_hasta=$pagina+$pagina_intervalo;
 
// Verificar que pagina_desde sea negativo
if($pagina_desde<1)
{ // le sumamos la cantidad sobrante para mantener el numero de enlaces mostrados $pagina_hasta-=($pagina_desde-1); $pagina_desde=1; } // Verificar que pagina_hasta no sea mayor que paginas_totales if($pagina_hasta>$total_paginas){
$pagina_desde-=($pagina_hasta-$total_paginas);
$pagina_hasta=$total_paginas;
if($pagina_desde<1){
$pagina_desde=1;
}
}
 
for ($i=$pagina_desde; $i<=$pagina_hasta; $i++)
{ 
if ($pagina == $i){
echo "<span class='pnumero'>".$pagina."</span> "; 
}else{
echo "<span class='pactiva'><a href='?pagina=".$i."> ".$i."</a></span> "; 
} 
}//END FOR
 
if(($pagina + 1)<=$total_paginas) {
echo " <span class='pactiva'><a href='?pagina=".($pagina+1)."'>Siguiente &raquo;</a></span>";
}
}



echo "</p></center>";
	
  echo "</div>";
  
 echo  "</body>";
  
//END LISTAR AMIGOS
}

function conteoamigosencomun ( $friends)
{
	global $session;
	
	 $numero = "SELECT count(*) comun , usuario1
			    FROM amigoscomunes
		   		WHERE usuario1 = '". $friends."'  AND comun != '".$session."'
		   		                   ";//filados
								   
	$insertnumero = mysql_query($numero);
								  
  while( $filamostrarconteo = mysql_fetch_array($insertnumero))
{
		   		                
 echo "<a style= ' position:relative; margin-left:30px; text-decoration:none; ' href='javascript:void(0)' onclick = '  mostrareldiv()' > ";
 echo "<span>tiene  <span>" .$filamostrarconteo['comun']. "</span>  amigos en comun</span>  </a>";		
	
}
}

function mostraramigosencomun($friends)
{
	global $session;
	
		 $mostrarcomun = "SELECT comun 
			    FROM amigoscomunes
		   		WHERE usuario1 = '". $friends."'  AND comun != '".$session."'
		   		                   ";//filados
								   
	$querymostrarcomun = mysql_query($mostrarcomun);
	$rowmostrarcomun = mysql_num_rows($querymostrarcomun);
	if($rowmostrarcomun > 0)
	{
								  
        while( $filamostraramigocomun = mysql_fetch_array($querymostrarcomun))
      {
		   			
						        
								 $consultanombre2 = "SELECT username 
								                     FROM site_members
								                     WHERE id = '".$filamostraramigocomun['comun']."' ";  
								 $queryconsultanombre2 = mysql_query($consultanombre2);
								 $filaconsultanombre2 = mysql_fetch_array($queryconsultanombre2);     	
								 			
						             
								 	
								                
        echo "<a style= ' position:relative; margin-left:30px; text-decoration:none; ' href=''  > ";
        echo  $filaconsultanombre2['username']."</a>";		
	
		
       } //END PRIMER WHILE	
	
	
	} //END IF 	

}// END FUNCTION 
	


function amigosencomun ()
{
		

global $session;


$consultausuario1 = "SELECT amigos
                             FROM amigos
                             WHERE usuario = '".$session."'
                             ";
                                                              /*ETE USUARIO EQUIVALE A LA VARIABLE $SESSION */

$queryusuario1 = mysql_query($consultausuario1);

while ($fila = mysql_fetch_array($queryusuario1)) 
{
	$amigos1 = $fila['amigos'];
		 
		 	 
		 
		 $consultaamigos = "SELECT amigos
                             FROM amigos
                             WHERE usuario = '".$session."'
                             ";
		 $queryusuario1_dos = mysql_query($consultaamigos);
		 
		 while($filados = mysql_fetch_array($queryusuario1_dos))
		 
		  {
		 
			$consulta_usuario_amigo = "SELECT amigos 
                             FROM amigos 
                             WHERE usuario  = '".$amigos1."' AND amigos = '".$filados['amigos']."'
                             
                             
                             "; 
			 
			 
			 $queryconsulta_usuario_amigo = mysql_query($consulta_usuario_amigo);
			 
			 
			 
			while($fila_tres = mysql_fetch_array($queryconsulta_usuario_amigo))
			
		   {
		   										
		   									
		   								
		   						$verificar = "SELECT comun, usuario1
		   						              FROM amigoscomunes
		   						              WHERE comun = '".$fila_tres['amigos']."' AND  usuario1 = '".$amigos1."'";	
		   						
		   					 $queryverificacion = mysql_query($verificar);
		   					 $rowverificacion = mysql_num_rows($queryverificacion);
		   					 
		   					if(!$rowverificacion > 0)
							{
								  $insertamigocomun = "INSERT INTO amigoscomunes(usuario1, comun)
                            
                                             values( '".$amigos1."', '".$fila_tres['amigos']."')
                                                                                                          "; 
			 
		   		                     $queryamigocomun = mysql_query($insertamigocomun);
								
								
						 	 

						    }	
						
						
						/*OPERACION 2 COMUN*/
						
						$verificar_dos = "SELECT comun, usuario1
		   						              FROM amigoscomunes
		   						              WHERE comun = '".$amigos1."' AND  usuario1 = '".$fila_tres['amigos']."'";	
		   						
		   					 $queryverificacion_dos = mysql_query($verificar_dos);
		   					 $rowverificacion_dos = mysql_num_rows($queryverificacion_dos);
		   					 
		   					if(!$rowverificacion_dos > 0)
							{
								  $insertamigocomun_dos = "INSERT INTO amigoscomunes(usuario1, comun)
                            
                                             values( '".$fila_tres['amigos']."', '".$amigos1."')
                                                                                                          "; 
			 
		   		                     $queryamigocomun_dos = mysql_query($insertamigocomun_dos);
								
								
						 	 

						    }	
						
						
						
						
		   		   			
	        }
	}
	}
	
} /// END FUNCTION AMIGOS EN COMUN



function borraramigo ($borrar)
{
	
   global $session;
	
  $borrado1= mysql_query("DELETE FROM amigos WHERE usuario = '" .$borrar. "' AND amigos = '" .$session. "'");

  $borrado2= mysql_query("DELETE FROM amigos WHERE usuario = '" .$session. "' AND amigos = '" .$borrar. "'");

  
  $eliminarnoticiaamistad = "SELECT id 
                             FROM amigos
                             WHERE usuario = '".$session."' AND amigos = '".$borrar."' ";
  $queryeliminarnoticiaamistad = mysql_query($eliminarnoticiaamistad);
  $rowqueryeliminarnoticiaamistad = mysql_num_rows($queryeliminarnoticiaamistad);
  if($rowqueryeliminarnoticiaamistad > 0)
  {
  	while($fila = mysql_fetch_array($queryeliminarnoticiaamistad) )
	{
		$eliminacionnoticiaamistad = "DELETE 
		                              FROM news
		                              WHERE codigoevento = '".$fila['id']."'";
		$querysuprimirnoticia = mysql_query($eliminarnoticiaamistad);
		
	}
  }
  
  $eliminarenviosolicitud = "DELETE 
                             FROM news
                             WHERE usuario = '".$borrar."' AND recipient = '".$session."'";
  $queryeliminarenviosolicitud = mysql_query($eliminarenviosolicitud);
  
  
  $eliminarenviosolicitud = "DELETE 
                             FROM news
                             WHERE usuario = '".$session."' AND recipient = '".$borrar."'";
  $queryeliminarenviosolicitud = mysql_query($eliminarenviosolicitud);
  
  
}// END FUNCION BORRAR AMIGO
			    




}
//end class
?>