package com.hashstudioz.moviebooking;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.hashstudioz.moviebooking.entities.User;
import com.hashstudioz.moviebooking.entities.classenum.Role;
import com.hashstudioz.moviebooking.entities.classenum.Status;
import com.hashstudioz.moviebooking.repository.UserRepo;

@SpringBootApplication
public class MoviebookingApplication implements CommandLineRunner {
	
	@Autowired
	private UserRepo userRepo;

	public static void main(String[] args) {
		SpringApplication.run(MoviebookingApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		User adminAccount = userRepo.findByRole(Role.ADMIN);
		if(adminAccount == null) {
			User user = new User();
			user.setEmail("admin@gmail.com");
			user.setName("ADMIN");
			user.setPassword(new BCryptPasswordEncoder().encode("Admin"));
			user.setRole(Role.ADMIN);
			user.setCreatedDate(java.time.LocalDate.now().toString());
			user.setStatus(Status.ACTIVE);
			userRepo.save(user);
		}	
	}

    @Bean
    InternalResourceViewResolver jspViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/view/");
		resolver.setSuffix(".jsp");
		return resolver;
	}
}
