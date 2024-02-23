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
import lombok.Data;


@Data
@Entity
@Table(name = "theatre_table")
@EntityListeners(AuditingEntityListener.class)
@Transactional
public class Theatre implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3517180061821039618L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long theatreId;
	private boolean deleted = Boolean.FALSE;
	private String theatreName;
    private String city;
}
