package com.srb.institutemanagement.repository;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.srb.institutemanagement.entity.UserAppoinmentEntity;

@Repository
public interface UserAppointmentRepository extends JpaRepository<UserAppoinmentEntity, UUID>{

}
