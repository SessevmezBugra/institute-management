package com.srb.institutemanagement.service;

import java.util.List;
import java.util.UUID;

import com.srb.institutemanagement.dto.TrainingDto;
import com.srb.institutemanagement.dto.TrainingMoveDto;
import com.srb.institutemanagement.dto.TrainingSectionDto;

public interface TrainingService {

	public void createTraining(TrainingDto dto);

	public void updateTraining(TrainingDto dto);

	public void deleteTrainingById(UUID id);

	public TrainingDto findTrainingById(UUID id);

	public List<TrainingDto> findTrainingByUserId(String userId);
	
	public void createTrainingSection(UUID trainingId, TrainingSectionDto dto);

	void updateTrainingSection(TrainingSectionDto dto);

	public void deleteTrainingSectionById(UUID id);

	public TrainingSectionDto findTrainingSectionById(UUID id);

	public List<TrainingSectionDto> findTrainingSectionByTrainingId(UUID trainingId);
	
	public void createTrainingMove(UUID trainingSectionId, TrainingMoveDto dto);

	public void updateTrainingMove(TrainingMoveDto dto);

	public void deleteTrainingMoveById(UUID id);

	public TrainingMoveDto findTrainingMoveById(UUID id);

	public List<TrainingMoveDto> findTrainingMoveBySectionId(UUID sectionId);
	
}