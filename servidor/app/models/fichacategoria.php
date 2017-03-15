<?php

class FichaCategoria extends Eloquent {

	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'ficha_categorias';
	
	
	
	# FICHAS
	
	Public function fichas() {
	
		return $this->hasMany('Ficha', 'ficha_categorias', 'categoria_id');
	}
	
	
	# TAGS
	
	Public function tags() {
	
		return $this->belongsToMany("Tag", "categoria_tag", "categoria_id", "tag_id");
	}
	
	
	
}


?>