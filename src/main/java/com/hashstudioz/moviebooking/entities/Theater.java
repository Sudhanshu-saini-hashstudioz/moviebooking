package com.hashstudioz.moviebooking.entities;

import java.io.Serializable;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.transaction.Transactional;


@Entity
@Table(name = "theater_table")
@EntityListeners(AuditingEntityListener.class)
@Transactional
public class Theater implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3517180061821039618L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long theaterId;
	private String theaterName;
    private String city;

	public Theater() {
		super();
		
	}

	public Theater(long theaterId, String theaterName, String city ) {
		super();
		this.theaterId = theaterId;
		this.theaterName = theaterName;
		this.city = city;
		
	}

	public long getTheaterId() {
		return theaterId;
	}

	public void setTheaterId(long theaterId) {
		this.theaterId = theaterId;
	}

	public String getTheaterName() {
		return theaterName;
	}

	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Override
	public String toString() {
		return "Theater [theaterId=" + theaterId + ", theaterName=" + theaterName + ", city=" + city + "]";
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
