<?php

class Ficha_Presentacion extends Eloquent {

	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'fichas_presentaciones';
	
	
	
	# RETURN presentaciones
	
	Public function ficha() {
	
		return $this->belongsTo('ficha');
	}
	

}

?>