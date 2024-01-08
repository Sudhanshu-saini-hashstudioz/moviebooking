package com.hashstudioz.moviebooking.repository.theater;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.hashstudioz.moviebooking.entities.Theater;

@Repository
public interface TheaterRepository extends JpaRepository<Theater , Long> {
	
	Page<Theater> findByTheaterName(@Param("theaterName") String name, Pageable pageable);

	Page<Theater> findByCity(@Param("city") String name, Pageable pageable);

}
