package com.srb.institutemanagement.entity;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
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
@Table(name = "SERVICE_PROVIDER_USER_HOLIDAY_SCHEDULE")
public class ServiceProviderUserHolidayScheduleEntity extends Auditable<String> implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
    @Column(name="ID")
    @GeneratedValue
    private UUID id;
	
	@Column(name="USER_ID")
    private String userId;
	
	@Column(name="START_DATE")
    private LocalDateTime startDate;
	
	@Column(name="END_DATE")
    private LocalDateTime endDate;
	
	@OneToOne(mappedBy = "serviceProviderUserHolidaySchedule", fetch = FetchType.LAZY)
	private ServiceProviderUserHolidayScheduleInstituteMappingEntity instituteMapping;
}