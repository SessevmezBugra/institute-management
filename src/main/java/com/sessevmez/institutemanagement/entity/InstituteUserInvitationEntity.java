package com.sessevmez.institutemanagement.entity;

import java.io.Serializable;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.sessevmez.institutemanagement.enums.InvitationStatus;
import com.sessevmez.institutemanagement.enums.UserRole;

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
@Table(name = "INSTITUTE_USER_INVITATION")
public class InstituteUserInvitationEntity extends Auditable<String> implements Serializable {

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
	
	@Enumerated(EnumType.STRING)
	@Column(name="ROLE")
	private UserRole role;
	
	@Enumerated(EnumType.STRING)
	@Column(name="STATUS")
	private InvitationStatus status;
	
}
