package com.sessevmez.institutemanagement.repository;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sessevmez.institutemanagement.entity.ServiceProviderUserScheduleEntity;

@Repository
public interface ServiceProviderUserScheduleRepository extends JpaRepository<ServiceProviderUserScheduleEntity, UUID>{

}
