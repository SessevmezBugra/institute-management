package com.sessevmez.institutemanagement.service;

import java.util.List;
import java.util.UUID;

import com.sessevmez.institutemanagement.entity.ServiceProviderUserScheduleEntity;
import com.sessevmez.institutemanagement.entity.UserAppoinmentEntity;

public interface UserService {

	public void acceptInvitation(UUID invitationId);
	
	public void rejectInvitation(UUID invitationId);
	
	public void createServiceProviderUserSchedule(List<ServiceProviderUserScheduleEntity> schedules);
	
	public void createAppointment(UserAppoinmentEntity appoinmentEntity);
	
	public void deleteAppointmentById(UUID appointmentId);
}
