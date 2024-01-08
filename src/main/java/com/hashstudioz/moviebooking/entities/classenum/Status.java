package com.hashstudioz.moviebooking.entities.classenum;

import com.fasterxml.jackson.annotation.JsonFormat;

public enum Status {
	@JsonFormat(shape = JsonFormat.Shape.STRING)
	DEACTIVATE,
	@JsonFormat(shape = JsonFormat.Shape.STRING)
	ACTIVE,

}
