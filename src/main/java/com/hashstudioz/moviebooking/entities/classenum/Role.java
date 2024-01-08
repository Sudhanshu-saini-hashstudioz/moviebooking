package com.hashstudioz.moviebooking.entities.classenum;

import com.fasterxml.jackson.annotation.JsonFormat;

public enum Role {
	@JsonFormat(shape = JsonFormat.Shape.STRING)
	USER,
	@JsonFormat(shape = JsonFormat.Shape.STRING)
	ADMIN
}
