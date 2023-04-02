package com.srb.institutemanagement.entity;

import java.io.Serializable;
import java.time.LocalTime;
import java.util.List;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
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
@Table(name = "SERVICE_PROVIDER_USER_WORK_SCHEDULE")
public class ServiceProviderUserWorkScheduleEntity extends Auditable<String> implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
    @Column(name="ID")
    @GeneratedValue
    private UUID id;
	
	@Column(name="USER_ID")
    private String userId;
	
	@Column(name="DAY_OF_WEEK")
    private String dayOfWeek;
	
	@Column(name="START_TIME")
    private LocalTime startTime;
	
	@Column(name="END_TIME")
    private LocalTime endTime;
	
	@OneToMany(mappedBy = "serviceProviderUserWorkSchedule", fetch = FetchType.LAZY)
	private List<UserAppoinmentEntity> appointments;
	
	@OneToOne(mappedBy = "serviceProviderUserWorkSchedule", fetch = FetchType.LAZY)
	private ServiceProviderUserWorkScheduleInstituteMappingEntity instituteMapping;
}