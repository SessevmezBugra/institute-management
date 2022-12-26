package com.sessevmez.institutemanagement.service;

import java.util.List;
import java.util.UUID;

import org.keycloak.representations.idm.UserRepresentation;

import com.sessevmez.institutemanagement.entity.InstituteEntity;
import com.sessevmez.institutemanagement.enums.UserRole;

public interface InstituteService {

	public InstituteEntity createInstitute(InstituteEntity instituteEntity);
	
	public InstituteEntity updateInstitute(InstituteEntity instituteEntity);
	
	public void deleteInstituteById(UUID instituteId);
	
	public InstituteEntity findById(UUID instituteId);
	
	public List<InstituteEntity> findByUserIdAndIsDeleted(String userId, Boolean isDeleted);
	
	public void inviteUser(UUID instituteId, String userId, UserRole userRole);
	
	public List<UserRepresentation> findUsersByInstituteIdAndUserRole(UUID instituteId, UserRole userRole);
}
