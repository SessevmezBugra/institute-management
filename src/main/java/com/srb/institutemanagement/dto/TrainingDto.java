package com.srb.institutemanagement.dto;

import java.util.UUID;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class TrainingDto extends BaseDto<String>{

	private UUID id;
	
	private String name;
	
	private String desc;
	
	private String userId;
	
	private String creatorFirstName;
	
	private String creatorLastName;

}
