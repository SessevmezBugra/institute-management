package com.srb.institutemanagement.dto;

import java.util.UUID;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class TrainingMoveDto extends BaseDto<String> {

	private UUID id;

	private String name;

	private String setNumber;

	private String repetitionNumber;
}
