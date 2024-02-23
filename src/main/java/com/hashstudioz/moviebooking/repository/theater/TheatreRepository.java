package com.hashstudioz.moviebooking.repository.theater;

import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.hashstudioz.moviebooking.entities.Theatre;

@Repository
public interface TheatreRepository extends JpaRepository<Theatre , Long> {
	
	@Query("SELECT t FROM Theatre t WHERE LOWER(t.theatreName) LIKE LOWER(CONCAT('%', :name, '%')) AND t.deleted= false")
	List<Theatre> findByTheatreName( String name);

	Page<Theatre> findByCity(@Param("city") String name, Pageable pageable);

	@Query("SELECT t FROM Theatre t WHERE t.deleted = false")
	List<Theatre> findTheatre();

	@Modifying
    @Query("UPDATE Theatre t SET t.deleted = true WHERE t.theatreId = :theatreId")
	void deleteTheatre(long theatreId);

	@Query("SELECT t FROM Theatre t WHERE LOWER(t.theatreName) LIKE LOWER(CONCAT('%', :name, '%'))AND t.deleted = false")
	List<Theatre> findAllTheatreByName(@Param("name")String name);

}
