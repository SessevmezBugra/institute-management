package com.srb.institutemanagement.service.impl;

import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.persistence.EntityNotFoundException;

import org.keycloak.representations.idm.UserRepresentation;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.srb.institutemanagement.entity.InstituteEntity;
import com.srb.institutemanagement.entity.InstituteUserInvitationEntity;
import com.srb.institutemanagement.entity.InstituteUserRoleMappingEntity;
import com.srb.institutemanagement.enums.InvitationStatus;
import com.srb.institutemanagement.enums.UserRole;
import com.srb.institutemanagement.repository.InstituteRepository;
import com.srb.institutemanagement.repository.InstituteUserInvitationRepository;
import com.srb.institutemanagement.repository.InstituteUserRoleMappingRepository;
import com.srb.institutemanagement.service.InstituteService;
import com.srb.institutemanagement.service.KeycloakUserService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class InstituteServiceImpl implements InstituteService {

	private final InstituteRepository instituteRepository;
	private final InstituteUserInvitationRepository instituteUserInvitationRepository;
	private final KeycloakUserService keycloakUserService;
	private final InstituteUserRoleMappingRepository instituteUserRoleMappingRepository;

	@Override
	public InstituteEntity createInstitute(InstituteEntity instituteEntity) {
		instituteEntity.setIsDeleted(Boolean.FALSE);
		return instituteRepository.save(instituteEntity);
	}

	@Override
	public InstituteEntity updateInstitute(InstituteEntity instituteEntity) {
		InstituteEntity foundEntity = findById(instituteEntity.getId());
		foundEntity.setName(instituteEntity.getName());
		return instituteRepository.save(foundEntity);
	}

	@Override
	public void deleteInstituteById(UUID instituteId) {
		InstituteEntity foundEntity = findById(instituteId);
		foundEntity.setIsDeleted(Boolean.TRUE);
		instituteRepository.save(foundEntity);
	}

	@Override
	public InstituteEntity findById(UUID instituteId) {
		return instituteRepository.findById(instituteId)
				.orElseThrow(() -> new EntityNotFoundException("Kurum bulunamadı."));
	}

	@Transactional(isolation = Isolation.REPEATABLE_READ)
	@Override
	public void inviteUser(UUID instituteId, String userId, UserRole userRole) {
		Optional<InstituteUserInvitationEntity> optInvitation = instituteUserInvitationRepository
				.findByUserIdAndInstituteId(userId, instituteId);
		optInvitation.ifPresent((i) -> new RuntimeException("Davet önceden gönderilmiştir."));
		InstituteEntity foundInstitute = findById(instituteId);
		InstituteUserInvitationEntity instituteUserInvitationEntity = InstituteUserInvitationEntity.builder()
				.institute(foundInstitute).role(userRole).status(InvitationStatus.PENDING).userId(userId).build();
		instituteUserInvitationRepository.save(instituteUserInvitationEntity);
	}

	@Override
	public List<InstituteEntity> findByUserIdAndIsDeleted(String userId, Boolean isDeleted) {
		return instituteRepository.findByUsersUserIdAndIsDeleted(userId, isDeleted).orElse(Collections.emptyList());
	}

	@Override
	public List<UserRepresentation> findUsersByInstituteIdAndUserRole(UUID instituteId, UserRole userRole) {
		List<UserRepresentation> users = new LinkedList<>();
		Optional<List<InstituteUserRoleMappingEntity>> optInstituteUsers = instituteUserRoleMappingRepository.findByInstituteIdAndRole(instituteId, userRole);
		optInstituteUsers.ifPresent((instituteUsers) -> {
			instituteUsers.forEach((user) -> {
				users.add(keycloakUserService.findByUserId(user.getUserId()));
			});
		});
		return users;
	}

}
