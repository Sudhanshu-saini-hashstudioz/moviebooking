package com.hashstudioz.moviebooking.repository.theater;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.hashstudioz.moviebooking.entities.Show;

@Repository
public interface ShowRepository extends JpaRepository< Show , Long>{

	Page<Show> findByTheaterTheaterIdAndScreenId(long theaterId , int screenId , Pageable pageable);

	Page<Show> findByUpcomingShows(String name, Pageable pageable);

}
