package com.srb.institutemanagement.repository;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.srb.institutemanagement.entity.ServiceProviderUserWorkScheduleEntity;

@Repository
public interface ServiceProviderUserScheduleRepository extends JpaRepository<ServiceProviderUserWorkScheduleEntity, UUID>{

}
