package com.hashstudioz.moviebooking.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.hashstudioz.moviebooking.entities.classenum.TicketClass;
import jakarta.persistence.CascadeType;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Version;
import lombok.Data;
import jakarta.persistence.JoinColumn;

@Entity
@Table(name = "shows_table")
@EntityListeners(AuditingEntityListener.class)
@Data
public class Show implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 15430933975842167L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long showId;
	@Version
	private long version;
	private String upcomingShows;
	private String runningTime;
	private int capacity;
	private int screenId;
	private double rating;
	private String genre;
	private String description;
	private String language;
	private String cast;
	private double classic = TicketClass.CLASSIC.getPrice();
	private double executive = TicketClass.EXECUTIVE.getPrice();
	private double lounge = TicketClass.LOUNGE.getPrice();

	@ManyToOne
	@JoinColumn(name = "theater_id")
	private Theater theater;
	
	@JsonManagedReference
	@OneToMany(mappedBy = "show", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<FileEntity> files = new ArrayList<>();

	@ElementCollection
	private List<Integer> bookedSeat = new ArrayList<>();

}
