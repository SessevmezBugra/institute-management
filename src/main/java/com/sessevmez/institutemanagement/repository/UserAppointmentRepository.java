package com.sessevmez.institutemanagement.repository;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sessevmez.institutemanagement.entity.UserAppoinmentEntity;

@Repository
public interface UserAppointmentRepository extends JpaRepository<UserAppoinmentEntity, UUID>{

}
