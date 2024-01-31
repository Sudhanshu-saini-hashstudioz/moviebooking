package com.hashstudioz.moviebooking.repository.theater;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hashstudioz.moviebooking.entities.Invoice;

@Repository
public interface InvoiceRepository extends JpaRepository<Invoice , Long>{

	List<Invoice> findByUserId(String email);

}
