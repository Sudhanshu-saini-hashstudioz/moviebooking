package com.hashstudioz.moviebooking.entities;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import com.hashstudioz.moviebooking.entities.classenum.TicketClass;
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
import jakarta.persistence.JoinColumn;

@Entity
@Table(name = "shows_table")
@EntityListeners(AuditingEntityListener.class)
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

	private double classic = TicketClass.CLASSIC.getPrice();
	private double executive = TicketClass.EXECUTIVE.getPrice();
	private double lounge = TicketClass.LOUNGE.getPrice();

	@ManyToOne
	@JoinColumn(name = "theater_id")
	private Theater theater;

	@OneToMany(mappedBy = "show")
	private Set<ShowPhotos> photos = new HashSet<>();

	@ElementCollection
	private Set<Integer> bookedSeat = new HashSet<>();

//	@ElementCollection
//	private List<String> photoPaths;

	public Show() {
		super();
	}

	public Show(long showId, long version, String upcomingShows, String runningTime, double classic, double executive,
			double lounge, int capacity, Set<Integer> bookedSeat, Theater theater, int screenId,
			 Set<ShowPhotos> photos) {
		super();
		this.showId = showId;
		this.version = version;
		this.upcomingShows = upcomingShows;
		this.runningTime = runningTime;
		this.screenId = screenId;
		this.classic = classic;
		this.executive = executive;
		this.lounge = lounge;
		this.theater = theater;
		this.bookedSeat = bookedSeat;
		this.capacity = capacity;
		this.photos = photos;
		// this.photoPaths = photoPaths;
	}

	public void setClassic(double classic) {
		this.classic = classic;
	}

	public void setExecutive(double executive) {
		this.executive = executive;
	}

	public void setLounge(double lounge) {
		this.lounge = lounge;
	}

	public long getShowId() {
		return showId;
	}

	public void setShowId(long showId) {
		this.showId = showId;
	}

	public String getUpcomingShows() {
		return upcomingShows;
	}

	public void setUpcomingShows(String upcomingShows) {
		this.upcomingShows = upcomingShows;
	}

	public String getRunningTime() {
		return runningTime;
	}

	public void setRunningTime(String runningTime) {
		this.runningTime = runningTime;
	}

	public void setTheater(Theater theater) {
		this.theater = theater;
	}

	public Theater getTheater() {
		return theater;
	}

	public double getClassic() {
		return classic;
	}

	public double getExecutive() {
		return executive;
	}

	public double getLounge() {
		return lounge;
	}

	public Set<Integer> getBookedSeat() {
		return bookedSeat;
	}

	public void setBookedSeat(Set<Integer> bookedSeat) {
		this.bookedSeat = bookedSeat;
	}

	public long getVersion() {
		return version;
	}

	public void setVersion(long version) {
		this.version = version;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public int getScreenId() {
		return screenId;
	}

	public void setScreenId(int screenId) {
		this.screenId = screenId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

//	public List<String> getPhotoPaths() {
//		return photoPaths;
//	}
//
//	public void setPhotoPaths(List<String> photoPaths) {
//		this.photoPaths = photoPaths;
//	}

	public Set<ShowPhotos> getPhotos() {
		return photos;
	}

	public void setPhotos(Set<ShowPhotos> photos) {
		this.photos = photos;
	}

	@Override
	public String toString() {
		return "Show [showId=" + showId + ", upcomingShows=" + upcomingShows + ", runningTime=" + runningTime + "]";
	}

}
