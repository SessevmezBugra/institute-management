package com.sessevmez.institutemanagement.entity;

import java.io.Serializable;
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
@Table(name = "SERVICE_PROVIDER_USER_SCHEDULE")
public class ServiceProviderUserScheduleEntity extends Auditable<String> implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
    @Column(name="ID")
    @GeneratedValue
    private UUID id;
	
	@Column(name="USER_ID")
    private String userId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "INSTITUTE_ID")
	private InstituteEntity institute;
	
	@Column(name="DAY_OF_WEEK")
    private String dayOfWeek;
	
	@Column(name="START_TIME")
    private String startTime;
	
	@Column(name="END_TIME")
    private String endTime;
	
	@Column(name="SLOT")
    private String slot;
}
