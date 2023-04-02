package com.srb.institutemanagement.entity;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Builder
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "USER_APPOINTMENT")
public class UserAppoinmentEntity extends Auditable<String> implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
    @Column(name="ID")
    @GeneratedValue
    private UUID id;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "SERVICE_PROVIDER_USER_WORK_SCHEDULE_ID")
	private ServiceProviderUserWorkScheduleEntity serviceProviderUserWorkSchedule;
	
	@Column(name="CUSTOMER_USER_ID")
    private String customerUserId;
	
	@Column(name="APPOINTMENT_DATE")
    private LocalDate appointmentDate;
}
