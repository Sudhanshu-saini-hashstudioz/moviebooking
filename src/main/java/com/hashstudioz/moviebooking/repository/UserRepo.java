package com.hashstudioz.moviebooking.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.hashstudioz.moviebooking.entities.User;
import com.hashstudioz.moviebooking.entities.classenum.Role;

@Repository
public interface UserRepo extends JpaRepository<User , Integer> {
	
	Optional<User> findByEmail(@Param("email") String email);
	
	User findByRole(Role role);

	void deleteByEmail(@Param("email") String email);

}
