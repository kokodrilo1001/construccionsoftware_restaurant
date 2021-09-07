<?php 
session_start();
//  Variables de Control
$url="#";     
if(empty($_GET)){
  $url="../controllers/control_login.php";  
}elseif($_GET['p']=="olvidar-clave" || $_GET['p']=="pregunta-seguridad"){
  $url="../controllers/control_recuperar_clave.php";  
}elseif($_GET['p']=="cambiar-contrasena"){
  $url="../controllers/control_cambiar_clave.php";  
}
?>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  	<title>:..El Dr. de la Computación..:</title>
    <!-- CSS Files -->
    <link rel="stylesheet" type="text/css" href="script/vendor/bootstrap/css/bootstrap.min.css">  
    <!-- JS Files -->
    <script src="script/vendor/jquery/jquery.min.js"></script>
    <script src="script/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!-- Other Files -->
    <script src="js/serv_usuario.js"></script>
  </head>
  <body>
    <div class="container">    
      <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
        <div class="panel panel-info" >
          <div class="panel-heading">
            <div class="panel-title">Acceder Al Sistema</div>
            <div style="float:right; font-size: 80%; position: relative; top:-10px">
			
              <?php if(empty($_GET['p'])){?> 
			  <!--
              <a href="?p=olvidar-clave">¿Olvidaste tu contraseña?</a>
			  -->
              <?php }?>
			  
            </div>
          </div>     
          <div style="padding-top:30px" class="panel-body" >
            <form id="loginform" class="form-horizontal" role="form" name="form1" method="POST" action="<?=  $url; ?>" <?php if(isset($_GET['p']) && $_GET['p']=='cambiar-contrasena') echo "onsubmit='return validar_contrasena()'"; ?> >
              <!-- AUTHENTICATION!--> 
              <?php if(empty($_GET['p'])){ ?> 
              <div style="margin-bottom: 25px" class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                <input id="usuario" type="text" class="form-control" onKeyUp="this.value=this.value.toUpperCase()" name="usuario" value="" placeholder="Introduce tu usuario" title="Por favor coloque su nombre de usuario" required />
              </div>
              <div style="margin-bottom: 25px" class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                <input id="contrasena" type="password" class="form-control" name="contrasena" placeholder="Contraseña" title="Por favor ingrese su contraseña" required />
              </div>
              <?php } ?>
              <!-- END AUTHENTICATION!-->
              <!-- USER IDENTIFY!-->
              <?php if(!empty($_GET['p']) and $_GET['p']=='olvidar-clave'){ ?>
              <div style="margin-bottom: 25px" class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                <input id="usuario" type="text" class="form-control" onKeyUp="this.value=this.value.toUpperCase()" name="user_name" value="" placeholder="Introduce tu usuario" title="Por favor coloque su nombre de usuario" required />
              </div>
              
              
              <input type="hidden" name="cambiar_clave_sin_logeo"/>
              
              <div style="margin-bottom: 25px" class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                <input id="contrasena_actual" type="password" class="form-control" name="contrasena_actual" title="Contraseña actual" value="<?php echo $_SESSION['user_passwd'];?>" readonly required />
              </div>
              <div style="margin-bottom: 25px" class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                <input id="nueva_contrasena" type="password" class="form-control" name="nueva_contrasena" placeholder="Nueva Contraseña" title="Por favor ingrese su nueva contraseña" required />
              </div>
              <div style="margin-bottom: 25px" class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                <input id="confirmar_contrasena" type="password" class="form-control" name="confirmar_contrasena" placeholder="Confirmar Contraseña" title="Por favor repita la contraseña ingresada" required />
              </div>
              <?php } ?>
              <!-- END CHANGE TO PASSWORD!-->
              <!-- BUTTON -->
              <div style="margin-top:10px" class="form-group">
                  <div class="col-sm-12 controls">
                    <input name="btn-login" type="submit" id="btn-login" value="Iniciar Sesión" class="btn btn-success"/>
                  </div>
              </div>
              <!-- END BUTTON -->
            </form>
          </div>
        </div>
      </div>
    </div>
    <?php
      if(isset($_SESSION['datos']['mensaje'])){
        echo "<script>alert('".$_SESSION['datos']['mensaje']."')</script>";	
        unset($_SESSION['datos']['mensaje']);	
        unset($_SESSION['pregunta_respuesta']);
      }
    ?>
  </body>
</html>
