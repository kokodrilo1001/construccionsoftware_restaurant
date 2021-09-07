<?php

class Conexion{

	protected function conectar(){
		try{

			$link = new PDO("mysql:host=localhost;dbname=restaurante1",
			            "root",
			            "");

			$link->exec("set names utf8");

			return $link;

		}catch (Exception $e){
			die('Error db(connect) '.$e->getMessage());
		}
	}
	

}