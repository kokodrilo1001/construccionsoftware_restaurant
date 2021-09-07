<?php
class Usuario{
    private $codigo;    
    private $username;
	private $contrasena;	
	private $codigoPerfil;
	private $descripcionPerfil;
    
    

    /**
     * Get the value of codigo
     */ 
    public function getCodigo()
    {
        return $this->codigo;
    }

    /**
     * Set the value of codigo
     *
     * @return  self
     */ 
    public function setCodigo($codigo)
    {
        $this->codigo = $codigo;

        return $this;
    }

    /**
     * Get the value of username
     */ 
    public function getUsername()
    {
        return $this->username;
    }

    /**
     * Set the value of username
     *
     * @return  self
     */ 
    public function setUsername($username)
    {
        $this->username = $username;

        return $this;
    }

	/**
	 * Get the value of contrasena
	 */ 
	public function getContrasena()
	{
		return $this->contrasena;
	}

	/**
	 * Set the value of contrasena
	 *
	 * @return  self
	 */ 
	public function setContrasena($contrasena)
	{
		$this->contrasena = $contrasena;

		return $this;
	}

	/**
	 * Get the value of codigoPerfil
	 */ 
	public function getCodigoPerfil()
	{
		return $this->codigoPerfil;
	}

	/**
	 * Set the value of codigoPerfil
	 *
	 * @return  self
	 */ 
	public function setCodigoPerfil($codigoPerfil)
	{
		$this->codigoPerfil = $codigoPerfil;

		return $this;
	}

	/**
	 * Get the value of descripcionPerfil
	 */ 
	public function getDescripcionPerfil()
	{
		return $this->descripcionPerfil;
	}

	/**
	 * Set the value of descripcionPerfil
	 *
	 * @return  self
	 */ 
	public function setDescripcionPerfil($descripcionPerfil)
	{
		$this->descripcionPerfil = $descripcionPerfil;

		return $this;
	}
}
?>