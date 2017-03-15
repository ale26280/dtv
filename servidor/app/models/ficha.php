<?php

class Ficha extends Eloquent {

	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'fichas';
	
	
	# CATEGORIA
	
	Public function categoria() {
	
		return $this->belongsTo("FichaCategoria", "categoria_id");
	}
	
	# FOTOS
	
	Public function fotos() {
	
		return $this->hasMany('FichaFoto')->orderBy('orden');
	}
	
	
	# FOTOS
	
	Public function videos() {
	
		return $this->hasMany('FichaVideo')->orderBy('orden');
	}
	
	
	# TAGS
	
	Public function tags() {
	
		return $this->belongsToMany('Tag', 'ficha_tag');
	}
	

}

?>