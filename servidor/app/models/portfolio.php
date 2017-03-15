<?php

class Portfolio extends Eloquent {

	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'portfolios';
	
	
	# VIDEOS
	
	Public function categoria() {
	
		return $this->belongsTo('PortfolioCategoria', 'categoria_id');
	}
	
	
	# VIDEOS
	
	Public function videos() {
	
		return $this->hasMany('PortfolioVideo');
	}
	
	
	
	# FOTOS
	
	Public function fotos() {
	
		return $this->hasMany('PortfolioFoto');
	}	
	
	
	# TAGS
	
	Public function Tags() {
	
		return $this->belongsToMany('Tag', 'portfolio_tag');
	}
	
}

?>