package com.srb.institutemanagement.repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.srb.institutemanagement.entity.InstituteUserRoleMappingEntity;
import com.srb.institutemanagement.enums.UserRole;

@Repository
public interface InstituteUserRoleMappingRepository extends JpaRepository<InstituteUserRoleMappingEntity, UUID>{

	Optional<List<InstituteUserRoleMappingEntity>> findByInstituteIdAndRole(UUID instituteId, UserRole userRole);
	
	Optional<InstituteUserRoleMappingEntity> findByInstituteIdAndUserIdAndRole(UUID instituteId, String userId, UserRole userRole);
}
