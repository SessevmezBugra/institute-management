package com.sessevmez.institutemanagement.repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sessevmez.institutemanagement.entity.InstituteEntity;

@Repository
public interface InstituteRepository extends JpaRepository<InstituteEntity, UUID>{

	Optional<List<InstituteEntity>> findByUsersUserId(String userId);
	
	Optional<List<InstituteEntity>> findByUsersUserIdAndIsDeleted(String userId, Boolean isDeleted);
}
