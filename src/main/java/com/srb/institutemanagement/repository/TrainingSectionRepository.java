package com.srb.institutemanagement.repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.srb.institutemanagement.entity.TrainingSectionEntity;

@Repository
public interface TrainingSectionRepository extends JpaRepository<TrainingSectionEntity, UUID> {

	Optional<List<TrainingSectionEntity>> findByTrainingId(UUID id);
}
