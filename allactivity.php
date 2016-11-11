<?php
session_start();
 @$session = $_SESSION["logged"];

mysql_connect("localhost", "root", "");
mysql_select_db("networksocial");

include ("conexionamigos.php");

echo " <a style=' position:relative; margin: 180px 0px 0px 70px; ' href='index.php'>Regresar</a> <br />";

echo $session. "<br />";



$consulta_actividad = "SELECT * FROM newsfeed WHERE usuario = '".$session."'   "; //ORDER BY hora

$queryactividad = mysql_query($consulta_actividad);

$rowactividad = mysql_num_rows($queryactividad);
 
 if($rowactividad > 0)
{

	while ($filaactividad = mysql_fetch_array($queryactividad) ) 
	{
		 $codigoevento = $filaactividad['codigoevento'];
		 $elevento = $filaactividad['evento'];
         $receptor = $filaactividad['recipient'];
	     //$usuario = $filaactividad['usuario'];
		 
		 if( isset($elevento[0]) )
		               
		    {
	                 
		
							  if($elevento == "aceptado")
							  {
							  	 
								 $consulta_nuevoamigo = "SELECT amigos
								                         FROM amigos  
								                         WHERE id = ".$codigoevento."  
								                         
								                                                     ";
								 
								 $queryminuevoamigo = mysql_query($consulta_nuevoamigo);
								 $rowsnuevoamigo = mysql_num_rows($queryminuevoamigo);
								 if($rowsnuevoamigo > 0 )
								 {
     								 	while($filanuevoamigo = mysql_fetch_array($queryminuevoamigo))
								 	  {
								 	  	
										 $consultanombres = " SELECT username 
									                          FROM site_members
															  WHERE id = ".$filanuevoamigo['amigos']."  ";
										 $queryconsultanombre = mysql_query($consultanombres);
										 $fila = mysql_fetch_array($queryconsultanombre);
										 
										 
										  $nombreusuariosession = " SELECT username 
									                                FROM site_members
															        WHERE id = ".$session. "  ";
										 $querynombreusersession = mysql_query($nombreusuariosession);
										 $filanombreusersession = mysql_fetch_array($querynombreusersession);
										
								           echo " <a style='text-decoration:none;   href=''>";
							
								           echo $filanombreusersession['username']." </a> y "; 
								           echo " <a style='text-decoration:none; 'href=''>".$fila['username']." </a> <span>son ahora amigos</span> <br /> ";		
										
								 	  }
		                  
						         }
                               
                              
						     }   //END IF PRIMER EVENTO SON AHORA AMIGOS
								 
				        
				        
				        /************************************/
				        /*EVENTO ENVIO SOLICITUD AMISTAD ***/
				        
				        
				        if($elevento == "envio")               //FUNCION AGREGAR USUARIO
							  {
							  	 
								
								 	  	
										 $consultanombres = " SELECT username 
									                          FROM site_members
															  WHERE id = ".$receptor."  ";
										 $queryconsultanombre = mysql_query($consultanombres);
										 $fila = mysql_fetch_array($queryconsultanombre);
										 
										 
										  $nombreusuariosession = " SELECT username 
									                                FROM site_members
															        WHERE id = ".$session. "  ";
										 $querynombreusersession = mysql_query($nombreusuariosession);
										 $filanombreusersession = mysql_fetch_array($querynombreusersession);
										
								           echo " <a style='text-decoration:none;   href=''>";
							
								           echo $filanombreusersession['username']." </a> <span>envio una solicitud de amistad a</span>  "; 
								           echo " <a style='text-decoration:none; 'href=''>".$fila['username']."  <br /> ";		
										
								 	  
		                  
						         
                               
                              
						     }   //END IF SEGUNDO EVENTO ANVIO SOLICITUD AMISTAD
				        
				        
						 
		 }            
					 
					 
		 
		 
		
	
	
	} //end while news
		 
		 
}	 
		 
		 
		 
		 
?>