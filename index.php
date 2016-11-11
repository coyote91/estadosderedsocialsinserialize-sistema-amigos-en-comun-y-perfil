<?php
//Make a database connection
session_start();
mysql_connect("localhost", "root", "");
mysql_select_db("networksocial");

include ("conexionamigos.php");


//Login section start
if(!isset($_SESSION["logged"])) 
{
  if(isset($_POST["username"]) && ($_POST['password'])) 
  
  {
    $query = mysql_query("SELECT id FROM site_members WHERE username = '".$_POST["username"]."' AND  password = '". $_POST["password"]."' ");
    if(mysql_num_rows($query) > 0) 
	{
      $row = mysql_fetch_array($query);
      $_SESSION["logged"] = $row["id"];
      header("Location: " . $_SERVER["PHP_SELF"]);
    }
  } 
  else 
  {
    echo("<!DOCTYPE HTML>
	<html lang='en-US'>
	<head>
		<meta charset='UTF-8'>
		<title></title>
	</head>
	<body>
		
		
		 <fieldset style='width:380px; position: relative; margin:10px auto;'>
		 
		  <legend style=''>The Facebook </legend>
		
			<form method=\"POST\">
                 <input type=\"text\" name=\"username\" placeholder=\"Nombre\">
	             <input type=\"password\" name=\"password\" placeholder=\"Contraseña\"> <br />
                 <input style='border-radius:4px; border:1px solid #ccc; position: relative; margin:6px 0px 0px 40px; ' type=\"submit\" name=\"submit\">  
           </form>
	
	    </fieldset>
	
	
	</body>
	</html>");
  }
} 
                                /*================================*/
else {
//end of login section

echo "<div style='width:100px; height:auto; position:relative; margin: 0 800px; background-color:lime;'><a href='logout.php'>Cerrar Sesion</a></div>";

$amistad = new Solicitudamistad();
$amistad->nombreusuario();
$amistad->contarsolicitud();
$amistad->contaramigos();                                                                                                
 

   
    echo "<a  style=' position:absolute; text-decoration: none; color: orange; font-weight:bold; margin:9px 0px 0px 560px; '  href='newsfeed.php'>Newsfeed </a> ";    
	
	   
    echo "<a  style=' position:absolute; text-decoration: none; color: orange; font-weight:bold; margin:9px 0px 0px 760px; '  href='allactivity.php'>Mi Actividad</a> ";   
    
   
 
$amistad->listarmiembros();
@$amistad->agregarusuario($add);



} 


?>