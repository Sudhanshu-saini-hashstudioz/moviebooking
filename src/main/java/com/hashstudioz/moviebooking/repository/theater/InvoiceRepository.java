package com.hashstudioz.moviebooking.repository.theater;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.hashstudioz.moviebooking.entities.Invoice;

@Repository
public interface InvoiceRepository extends JpaRepository<Invoice , Long>{

	@Query("SELECT i FROM Invoice i WHERE LOWER(i.userId) LIKE LOWER(CONCAT('%', :email, '%')) ORDER BY i.booked_date DESC")
	List<Invoice> findByUserId(String email);
	
	@Modifying
    @Query("UPDATE Invoice i SET i.deleted = true WHERE i.userId = :userId")
	void deleteByInvoiceId(String userId);
	
	@Query("SELECT i FROM Invoice i where i.deleted = false ORDER BY i.booked_date DESC")
	List<Invoice> findAllInvoices();

	@Query("SELECT i FROM Invoice i WHERE LOWER(i.userId) = LOWER(:email)  ORDER BY i.booked_date DESC")
	List<Invoice> findUserInvoices(String email);

	@Modifying
    @Query("UPDATE Invoice i SET i.deleted = true WHERE i.show.showId = :showId")
	void deleteInvoiceByShowId(long showId);

	@Query("SELECT i FROM Invoice i WHERE LOWER(i.userId) = LOWER(:email) AND i.payment_status != 'paid'  ORDER BY i.booked_date DESC")
	List<Invoice> findUserInvoicesWithoutUpdated(String email);
}
