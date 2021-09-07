<?php
session_start();
include("../model/Usuario.php");
include("../dao/UsuarioDao.php");
$preguntas=null;
$respuestas=null;
$usuarioinput=new Usuario(); 
$usuarioDao=new UsuarioDao();
$usuarioinput->setUsername(trim($_POST['usuario']));
$usuarioinput->setContrasena(trim($_POST['contrasena']));
$res=$usuarioDao->Buscar($usuarioinput);
echo $res;
echo $res['estado'];
if($res!=null){
   if($res['estado']!='A'){
      $_SESSION['datos']['mensaje']="Error de usuario o contraseña";
      header("Location: ../view/login.php");
   }else{
      
      $_SESSION['uid']=$res['id'];
      $_SESSION['username']=$res['username'];
      $_SESSION['role']=$res['codigoPerfil'];
      $_SESSION['user_role']=$res['desPerfil'];
      $_SESSION['nombreUsuario']=$res['nombres'].' '.$res['apellidos'];
      header("Location: ../view/index.php");
   }
}else{
   $_SESSION['datos']['mensaje']="Usuario/Clave incorrecto!";
   header("Location: ../view/login.php");
}
?>