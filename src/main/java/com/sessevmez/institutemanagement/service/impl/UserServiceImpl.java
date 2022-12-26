package com.sessevmez.institutemanagement.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;

import com.sessevmez.institutemanagement.entity.ServiceProviderUserScheduleEntity;
import com.sessevmez.institutemanagement.entity.UserAppoinmentEntity;
import com.sessevmez.institutemanagement.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Override
	public void acceptInvitation(UUID invitationId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void rejectInvitation(UUID invitationId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void createServiceProviderUserSchedule(List<ServiceProviderUserScheduleEntity> schedules) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void createAppointment(UserAppoinmentEntity appoinmentEntity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAppointmentById(UUID appointmentId) {
		// TODO Auto-generated method stub
		
	}


}
