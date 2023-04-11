package com.srb.institutemanagement.entity;

import java.io.Serializable;
import java.util.List;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
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
@Table(name = "INSTITUTE")
public class InstituteEntity extends Auditable<String> implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
    @Column(name="ID")
    @GeneratedValue
    @Type(type="org.hibernate.type.UUIDCharType")
    private UUID id;
	
	@Column(name="NAME")
    private String name;
	
	@Column(name="IS_DELETED")
    private Boolean isDeleted;
	
	@OneToMany(mappedBy = "institute", fetch = FetchType.LAZY)
	private List<InstituteUserRoleMappingEntity> users;
	
	@OneToMany(mappedBy = "institute", fetch = FetchType.LAZY)
	private List<InstituteUserInvitationEntity> invitations;
	
	@OneToMany(mappedBy = "institute", fetch = FetchType.LAZY)
	private List<ServiceProviderUserWorkScheduleInstituteMappingEntity> userScheduleMappings;
}
