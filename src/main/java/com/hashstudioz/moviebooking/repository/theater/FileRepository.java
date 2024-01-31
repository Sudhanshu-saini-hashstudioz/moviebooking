package com.hashstudioz.moviebooking.repository.theater;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hashstudioz.moviebooking.entities.FileEntity;

public interface FileRepository extends JpaRepository<FileEntity , Long> {


}
