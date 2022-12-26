package com.sessevmez.institutemanagement.entity;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
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
	
	@Column(name="SERVICE_PROVIDER_USER_ID")
    private String serviceProviderUserId;
	
	@Column(name="CUSTOMER_USER_ID")
    private String customerUserId;
	
	@Column(name="APPOINTMENT_DATE")
    private LocalDateTime appointmentDate;
}
