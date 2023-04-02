package com.srb.institutemanagement.repository;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.srb.institutemanagement.entity.InstituteUserInvitationEntity;

@Repository
public interface InstituteUserInvitationRepository extends JpaRepository<InstituteUserInvitationEntity, UUID> {

	Optional<InstituteUserInvitationEntity> findByUserIdAndInstituteId(String userId, UUID instituteId);
}
