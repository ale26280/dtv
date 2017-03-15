<?php

class Slider extends Eloquent {

	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'sliders';
	
	
	# FOTOS
	
	Public function fotos() {
		Return $this->hasMany('sliderfoto', 'slider_id')->orderBy('orden');
	}

}

?>