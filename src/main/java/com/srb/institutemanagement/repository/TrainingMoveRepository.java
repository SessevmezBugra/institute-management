package com.srb.institutemanagement.repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.srb.institutemanagement.entity.TrainingMoveEntity;

@Repository
public interface TrainingMoveRepository extends JpaRepository<TrainingMoveEntity, UUID> {

	Optional<List<TrainingMoveEntity>> findBySectionId(UUID id);
}
