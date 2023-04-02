package com.srb.institutemanagement.dto;

import java.util.Date;

import lombok.Data;

@Data
public abstract class BaseDto<T> {

	protected Date createdDate;

	protected T createdBy;

	protected Date updatedOn;

	protected T updatedBy;
}
