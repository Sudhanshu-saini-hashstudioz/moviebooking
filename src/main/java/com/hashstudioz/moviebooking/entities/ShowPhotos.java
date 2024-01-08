package com.hashstudioz.moviebooking.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

@Entity
public class ShowPhotos  {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    private String photoPath;

    @ManyToOne
    private Show show;

	public ShowPhotos() {
		super();
		
	}

	public ShowPhotos(long id, String photoPath, Show show) {
		super();
		this.id = id;
		this.photoPath = photoPath;
		this.show = show;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getPhotoPath() {
		return photoPath;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

	public Show getShow() {
		return show;
	}

	public void setShow(Show show) {
		this.show = show;
	}
}

