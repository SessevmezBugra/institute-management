package com.srb.institutemanagement.service.impl;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.stereotype.Service;

import com.srb.institutemanagement.entity.InstituteUserInvitationEntity;
import com.srb.institutemanagement.entity.InstituteUserRoleMappingEntity;
import com.srb.institutemanagement.entity.ServiceProviderUserHolidayScheduleEntity;
import com.srb.institutemanagement.entity.ServiceProviderUserWorkScheduleEntity;
import com.srb.institutemanagement.entity.UserAppoinmentEntity;
import com.srb.institutemanagement.enums.InvitationStatus;
import com.srb.institutemanagement.repository.InstituteUserInvitationRepository;
import com.srb.institutemanagement.repository.InstituteUserRoleMappingRepository;
import com.srb.institutemanagement.service.UserService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

	private final InstituteUserInvitationRepository instituteUserInvitationRepository;
	private final InstituteUserRoleMappingRepository instituteUserRoleMappingRepository;

	@Override
	public void acceptInvitation(UUID invitationId) {
		Optional<InstituteUserInvitationEntity> optInvitation = instituteUserInvitationRepository
				.findById(invitationId);
		InstituteUserInvitationEntity i = optInvitation.orElseThrow(() -> new RuntimeException("Davet bulunamadı."));
		if (i.getStatus() == InvitationStatus.ACCEPTED)
			throw new RuntimeException("Davet önceden kabul edilmiştir.");
		i.setStatus(InvitationStatus.ACCEPTED);
		instituteUserInvitationRepository.save(i);
		Optional<InstituteUserRoleMappingEntity> optUser = instituteUserRoleMappingRepository.findByInstituteIdAndUserIdAndRole(i.getInstitute().getId(), i.getUserId(), i.getRole());
		optUser.ifPresentOrElse((u) -> {
			if(u.getIsDeleted().equals(Boolean.FALSE))
				throw new RuntimeException("Aynı rol ile kurumda aktifliğiniz devam etmektedir.");
			u.setIsDeleted(Boolean.FALSE);
			instituteUserRoleMappingRepository.save(u);
		}, () -> {
			InstituteUserRoleMappingEntity instituteUserRoleMappingEntity = InstituteUserRoleMappingEntity.builder()
					.institute(i.getInstitute()).role(i.getRole()).userId(i.getUserId()).build();
			instituteUserRoleMappingRepository.save(instituteUserRoleMappingEntity);
		});

	}

	@Override
	public void rejectInvitation(UUID invitationId) {
		Optional<InstituteUserInvitationEntity> optInvitation = instituteUserInvitationRepository
				.findById(invitationId);
		InstituteUserInvitationEntity i = optInvitation.orElseThrow(() -> new RuntimeException("Davet bulunamadı."));
		if (i.getStatus() == InvitationStatus.REJECTED)
			throw new RuntimeException("Davet önceden red edilmiştir.");
		i.setStatus(InvitationStatus.REJECTED);
		instituteUserInvitationRepository.save(i);
	}

	@Override
	public void createServiceProviderUserWorkSchedule(List<ServiceProviderUserWorkScheduleEntity> schedules) {
		

	}

	@Override
	public void createAppointment(UserAppoinmentEntity appoinmentEntity) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteAppointmentById(UUID appointmentId) {
		// TODO Auto-generated method stub

	}

	@Override
	public void createServiceProviderUserHolidaySchedule(List<ServiceProviderUserHolidayScheduleEntity> schedules) {
		// TODO Auto-generated method stub

	}

}
