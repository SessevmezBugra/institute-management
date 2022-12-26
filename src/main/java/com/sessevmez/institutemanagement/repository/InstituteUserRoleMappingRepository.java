package com.sessevmez.institutemanagement.repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sessevmez.institutemanagement.entity.InstituteUserRoleMappingEntity;
import com.sessevmez.institutemanagement.enums.UserRole;

@Repository
public interface InstituteUserRoleMappingRepository extends JpaRepository<InstituteUserRoleMappingEntity, UUID>{

	Optional<List<InstituteUserRoleMappingEntity>> findByInstituteIdAndUserRole(UUID instituteId, UserRole userRole);
}
