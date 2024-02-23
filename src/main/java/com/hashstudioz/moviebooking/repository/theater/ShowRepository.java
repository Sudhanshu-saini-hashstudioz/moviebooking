package com.hashstudioz.moviebooking.repository.theater;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.hashstudioz.moviebooking.entities.Show;
import com.hashstudioz.moviebooking.entities.Theatre;

@Repository
public interface ShowRepository extends JpaRepository< Show , Long>{

	List<Show> findByTheatreTheatreIdAndScreenId(long theatreId , int screenId);

	Page<Show> findByUpcomingShows(String name, Pageable pageable);
	
	@Query("SELECT s FROM Show s WHERE s.upcomingShows=:name AND s.deleted = false ORDER BY s.theatre.theatreName DESC")
	List<Show> findByUpcomingShows(String name);

	void deleteByTheatreTheatreId(long theatreId);

	@Query("SELECT s FROM Show s WHERE LOWER(s.upcomingShows) LIKE LOWER(CONCAT('%', :name, '%')) AND s.deleted = false")
	List<Show> findByShowByNameLike(String name);

	@Query("SELECT s FROM Show s WHERE s.deleted = false")
	List<Show> findShows();

	@Modifying
    @Query("UPDATE Show s SET s.deleted = true WHERE s.showId = :showId")
	void deleteShow(long showId);

	List<Show> findByTheatreTheatreId(long theatreId);

	@Query("SELECT DISTINCT s.upcomingShows FROM Show s WHERE LOWER(s.upcomingShows) LIKE LOWER(CONCAT('%', :name, '%')) OR (s.theatre.city) LIKE LOWER(CONCAT('%', :name, '%')) AND s.deleted = false")
	List<String> findByShowNameAndCity(String name);

	@Query("SELECT DISTINCT s.upcomingShows FROM Show s where s.deleted = false")
	List<String> findDistinctShow();
	
//	@Query("SELECT sFROM Show s WHERE s.upcomingShows = name")
//	List<Show> findByUpcomingShows(String name);

}
