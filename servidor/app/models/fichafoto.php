<?php

class FichaFoto extends Eloquent {

	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'ficha_fotos';
	
	
	
	# RETURN presentaciones
	
	Public function ficha() {
	
		return $this->belongsTo('ficha');
	}
	

}

?>