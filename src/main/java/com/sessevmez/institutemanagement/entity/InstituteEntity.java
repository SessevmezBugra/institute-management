package com.sessevmez.institutemanagement.entity;

import java.io.Serializable;
import java.util.List;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
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
@Table(name = "INSTITUTE")
public class InstituteEntity extends Auditable<String> implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
    @Column(name="ID")
    @GeneratedValue
    private UUID id;
	
	@Column(name="NAME")
    private String name;
	
	@Column(name="IS_DELETED")
    private Boolean isDeleted;
	
	@OneToMany(mappedBy = "institute", fetch = FetchType.LAZY, cascade = CascadeType.PERSIST)
	private List<InstituteUserRoleMappingEntity> users;
	
	@OneToMany(mappedBy = "institute", fetch = FetchType.LAZY, cascade = CascadeType.PERSIST)
	private List<InstituteUserInvitationEntity> invitations;
	
	@OneToMany(mappedBy = "institute", fetch = FetchType.LAZY, cascade = CascadeType.PERSIST)
	private List<ServiceProviderUserScheduleEntity> userSchedules;
}
