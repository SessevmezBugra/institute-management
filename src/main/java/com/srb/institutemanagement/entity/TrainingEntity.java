package com.srb.institutemanagement.entity;

import java.io.Serializable;
import java.util.ArrayList;
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

import org.hibernate.annotations.Type;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@Entity
@Table(name = "TRAINING")
public class TrainingEntity extends Auditable<String> implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
    @Column(name="ID")
	@GeneratedValue
	@Type(type="org.hibernate.type.UUIDCharType")
    private UUID id;

	@Column(name = "NAME")
	private String name;
	
	@Column(name = "DESCRIPTION")
	private String desc;
	
	@Column(name="USER_ID")
	private String userId;

	@JsonManagedReference
	@OneToMany(mappedBy = "training", fetch = FetchType.LAZY, cascade = CascadeType.PERSIST)
	private List<TrainingSectionEntity> sections = new ArrayList<>();
}