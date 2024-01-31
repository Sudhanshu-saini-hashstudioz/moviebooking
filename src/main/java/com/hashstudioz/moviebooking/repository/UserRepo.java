package com.hashstudioz.moviebooking.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.hashstudioz.moviebooking.entities.User;
import com.hashstudioz.moviebooking.entities.classenum.Role;

@Repository
public interface UserRepo extends JpaRepository<User , Integer> {
	
	Optional<User> findByEmail(String email);
	
	User findByRole(Role role);
	
//	public List<User> findByNameLike(String name);
	
	@Query("SELECT u FROM User u WHERE LOWER(u.name) LIKE LOWER(CONCAT('%', :name, '%'))")
	List<User> findByNameLike(@Param("name") String name);

	void deleteByEmail(@Param("email") String email);

}
