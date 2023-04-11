package com.srb.institutemanagement.entity;

import java.io.Serializable;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

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
@Table(name = "SERVICE_PROVIDER_USER_WORK_SCHEDULE_INSTITUTE_MAPPING")
public class ServiceProviderUserWorkScheduleInstituteMappingEntity extends Auditable<String> implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
    @Column(name="ID")
    @GeneratedValue
    @Type(type="org.hibernate.type.UUIDCharType")
    private UUID id;
	
	@OneToOne
    @JoinColumn(name = "SERVICE_PROVIDER_USER_WORK_SCHEDULE_ID", unique = true)
	private ServiceProviderUserWorkScheduleEntity serviceProviderUserWorkSchedule;
	
	@ManyToOne
    @JoinColumn(name = "INSTITUTE_ID", unique = true)
	private InstituteEntity institute;
}
