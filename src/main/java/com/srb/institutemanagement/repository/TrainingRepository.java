package com.srb.institutemanagement.repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.srb.institutemanagement.entity.TrainingEntity;

@Repository
public interface TrainingRepository extends JpaRepository<TrainingEntity, UUID> {

	Optional<List<TrainingEntity>> findByUserId(String userId);
}
