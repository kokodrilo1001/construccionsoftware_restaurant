<?php
Class Empleado{
    /* @var int */
    private $ad;
    /* @var string */
    private $mesa1;
    private $nombres;
	private $nombreCompleto;
    /* @var usuario */
    private $usuario;

    public function __construct($codigo){
        $this->codigo=$codigo;
    }


 
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
     * Get the value of apellidos
     */ 
    public function getApellidos()
    {
        return $this->apellidos;
    }

    /**
     * Set the value of apellidos
     *
     * @return  self
     */ 
    public function setApellidos($apellidos)
    {
        $this->apellidos = $apellidos;

        return $this;
    }

    /**
     * Get the value of nombres
     */ 
    public function getNombres()
    {
        return $this->nombres;
    }

    /**
     * Set the value of nombres
     *
     * @return  self
     */ 
    public function setNombres($nombres)
    {
        $this->nombres = $nombres;

        return $this;
    }

	/**
	 * Get the value of nombreCompleto
	 */ 
	public function getNombreCompleto()
	{
		return $this->nombreCompleto;
	}

	/**
	 * Set the value of nombreCompleto
	 *
	 * @return  self
	 */ 
	public function setNombreCompleto($nombreCompleto)
	{
		$this->nombreCompleto = $nombreCompleto;

		return $this;
	}

    

    /**
     * Get the value of usuario
     */ 
    public function getUsuario()
    {
        return $this->usuario;
    }

    /**
     * Set the value of usuario
     *
     * @return  self
     */ 
    public function setUsuario($usuario)
    {
        $this->usuario = $usuario;

        return $this;
    }
}
?>