package com.srb.institutemanagement.service;

import java.util.List;
import java.util.UUID;

import com.srb.institutemanagement.entity.ServiceProviderUserHolidayScheduleEntity;
import com.srb.institutemanagement.entity.ServiceProviderUserWorkScheduleEntity;
import com.srb.institutemanagement.entity.UserAppoinmentEntity;

public interface UserService {

	public void acceptInvitation(UUID invitationId);
	
	public void rejectInvitation(UUID invitationId);
	
	public void createServiceProviderUserWorkSchedule(List<ServiceProviderUserWorkScheduleEntity> schedules);
	
	public void createServiceProviderUserHolidaySchedule(List<ServiceProviderUserHolidayScheduleEntity> schedules);

	public void createAppointment(UserAppoinmentEntity appoinmentEntity);
	
	public void deleteAppointmentById(UUID appointmentId);
}
