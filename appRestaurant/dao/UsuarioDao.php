<?php

require_once("../model/Usuario.php");
require_once("conexion.php");
class UsuarioDao extends conexion{

	public function Actualizar($user,$pold,$pnew,$rnew){


	}

	public function Registrar($user){
		
	}

	public function Intento_Fallido($bool){
		
	}

	public function Bloquear_Usuario(){
		
	}

	public function DesbloquearUsuario($user){
		
	}

	public function Buscar(Usuario $user){
		
		
		$sqlquery="SELECT u.id,u.username,r.dsccorta codigoPerfil,r.descripcion desperfil,e.nombres,e.apellidos
		FROM usuario u, empleado e, userxrol ur, rol r
		WHERE u.id=e.iduser
		AND u.id=ur.iduser
		AND ur.idrole=r.id
		AND ur.estado='A'
		AND u.estado='A'
		AND u.username=:username
		AND u.password=:password
		";

		try {
					
			$stmt = $this->conectar()->prepare($sqlquery);
			$stmt->bindParam(":username",$user->getUsername(), PDO::PARAM_STR);
			$stmt->bindParam(":password",$user->getContrasena(), PDO::PARAM_STR);
			$stmt -> execute();
	
			return $stmt -> fetch();
		} catch (Exception $e) {
			die('Error UsuarioDao : Buscar'.$e->getMessage());
		} finally{
			$stmt = null;
		}

		
	}


	
}
?>