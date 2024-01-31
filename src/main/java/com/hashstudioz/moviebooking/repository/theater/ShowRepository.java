package com.hashstudioz.moviebooking.repository.theater;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.hashstudioz.moviebooking.entities.Show;

@Repository
public interface ShowRepository extends JpaRepository< Show , Long>{

	List<Show> findByTheaterTheaterIdAndScreenId(long theaterId , int screenId);

	Page<Show> findByUpcomingShows(String name, Pageable pageable);

	void deleteByTheaterTheaterId(long theaterId);

	@Query("SELECT s FROM Show s WHERE LOWER(s.upcomingShows) LIKE LOWER(CONCAT('%', :name, '%'))")
	List<Show> findByShowByNameLike(String name);

}
