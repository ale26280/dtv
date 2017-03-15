<?php

class ViaPublicaLab extends Eloquent {

	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'viapublicalab';

	
	
	public function fotos() {	
	
		return $this->hasMany("viapublicalabfoto", "viapublicalab_id");
	}
}

?>