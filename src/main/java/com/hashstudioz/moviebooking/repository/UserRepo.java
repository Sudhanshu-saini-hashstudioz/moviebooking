package com.hashstudioz.moviebooking.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.hashstudioz.moviebooking.entities.User;
import com.hashstudioz.moviebooking.entities.classenum.Role;

@Repository
public interface UserRepo extends JpaRepository<User , Integer> {
	
	@Query("SELECT u FROM User u WHERE u.deleted = false")
	List<User> findUsers();
	
	Optional<User> findByEmail(String email);
	
	User findByRole(Role role);
	
	@Query("SELECT u FROM User u WHERE LOWER(u.name) LIKE LOWER(CONCAT('%', :name, '%')) AND u.deleted= false")
	List<User> findByNameLike(@Param("name") String name);

	@Modifying
    @Query("UPDATE User u SET u.deleted = true , u.status = DEACTIVATE WHERE u.email = :email")
	void deleteByEmail(@Param("email") String email);

}
