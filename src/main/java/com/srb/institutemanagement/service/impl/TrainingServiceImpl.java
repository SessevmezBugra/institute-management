package com.srb.institutemanagement.service.impl;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.keycloak.representations.idm.UserRepresentation;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import com.srb.institutemanagement.dto.TestDto;
import com.srb.institutemanagement.dto.TrainingDto;
import com.srb.institutemanagement.dto.TrainingMoveDto;
import com.srb.institutemanagement.dto.TrainingSectionDto;
import com.srb.institutemanagement.entity.TrainingEntity;
import com.srb.institutemanagement.entity.TrainingMoveEntity;
import com.srb.institutemanagement.entity.TrainingSectionEntity;
import com.srb.institutemanagement.repository.TrainingMoveRepository;
import com.srb.institutemanagement.repository.TrainingRepository;
import com.srb.institutemanagement.repository.TrainingSectionRepository;
import com.srb.institutemanagement.service.KeycloakUserService;
import com.srb.institutemanagement.service.TrainingService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TrainingServiceImpl implements TrainingService {
	
	private final TrainingRepository trainingRepository;
	private final TrainingSectionRepository trainingSectionRepository;
	private final TrainingMoveRepository trainingMoveRepository;
	private final KeycloakUserService keycloakUserService;
	private final ModelMapper modelMapper;
	
	@Override
	public void createTraining(TrainingDto dto) {
		TrainingEntity trainingEntity = modelMapper.map(dto, TrainingEntity.class);
//		UserRepresentation userRepresentation = keycloakUserService.findByUserId(trainingEntity.getUserId());
//		trainingEntity.setUserId(userRepresentation.getId());
		trainingRepository.save(trainingEntity);
	}

	@Override
	public void updateTraining(TrainingDto dto) {
		TrainingEntity foundTrainingEntity = findTrainingEntityById(dto.getId());
		foundTrainingEntity.setName(dto.getName());
		foundTrainingEntity.setDesc(dto.getDesc());
		trainingRepository.save(foundTrainingEntity);
	}

	@Override
	public void deleteTrainingById(UUID id) {
		trainingRepository.deleteById(id);
		
	}

	@Override
	public TrainingDto findTrainingById(UUID id) {
		TrainingEntity foundTrainingEntity = trainingRepository.findById(id).orElseThrow(() -> new RuntimeException("Antrenman bulunamadi"));
		return modelMapper.map(foundTrainingEntity, TrainingDto.class);
	}
	
	private TrainingEntity findTrainingEntityById(UUID id) {
		return trainingRepository.findById(id).orElseThrow(() -> new RuntimeException("Antrenman bulunamadi"));
	}

	@Override
	public List<TrainingDto> findTrainingByUserId(String userId) {
		List<TrainingDto> trainingDtos =  Arrays.asList(modelMapper.map(trainingRepository.findByUserId(userId).orElse(Collections.emptyList()), TrainingDto[].class));
		
		//v2 de açılacak
		
//		trainingDtos.parallelStream().forEach((w) -> {
//			if(!ObjectUtils.isEmpty(w.getCreatedBy())) {
//				try {
//					UserRepresentation userRepresentation = keycloakUserService.findByUserId(w.getCreatedBy());
//					w.setCreatorFirstName(userRepresentation.getFirstName());
//					w.setCreatorLastName(userRepresentation.getLastName());
//				} catch (Exception e) {
//					w.setCreatorFirstName("");
//					w.setCreatorLastName("");
//				}
//			}
//		});
		return trainingDtos;
	}

	@Override
	public void createTrainingSection(UUID trainingId, TrainingSectionDto dto) {
		TrainingSectionEntity entity = modelMapper.map(dto, TrainingSectionEntity.class);
		TrainingEntity foundTrainingEntity = findTrainingEntityById(trainingId);
		entity.setTraining(foundTrainingEntity);
		
//		if(!ObjectUtils.isEmpty(dto.getParent().getId())) {
//			TrainingSectionEntity foundParentSection = findTrainingSectionEntityById(dto.getParent().getId());
//			entity.setParent(foundParentSection);
//		}
		
		trainingSectionRepository.save(entity);
	}
	
	private TrainingSectionEntity findTrainingSectionEntityById(UUID id) {
		return trainingSectionRepository.findById(id).orElseThrow(() -> new RuntimeException("Antrenman bolumu bulunamadi"));
	}

	@Override
	public void updateTrainingSection(TrainingSectionDto dto) {
		TrainingSectionEntity foundTrainingSectionEntity = findTrainingSectionEntityById(dto.getId());
		foundTrainingSectionEntity.setName(dto.getName());
		foundTrainingSectionEntity.setDesc(dto.getDesc());
		trainingSectionRepository.save(foundTrainingSectionEntity);
	}

	@Override
	public void deleteTrainingSectionById(UUID id) {
		trainingSectionRepository.deleteById(id);
		
	}

	@Override
	public TrainingSectionDto findTrainingSectionById(UUID id) {
		TrainingSectionEntity trainingSectionEntity = findTrainingSectionEntityById(id);
		return modelMapper.map(trainingSectionEntity, TrainingSectionDto.class);
	}

	@Override
	public List<TrainingSectionDto> findTrainingSectionByTrainingId(UUID trainingId) {
		return Arrays.asList(modelMapper.map(trainingSectionRepository.findByTrainingId(trainingId).orElse(Collections.emptyList()), TrainingSectionDto[].class));
	}

	@Override
	public void createTrainingMove(UUID trainingSectionId, TrainingMoveDto dto) {
		TrainingMoveEntity entity = modelMapper.map(dto, TrainingMoveEntity.class);
		TrainingSectionEntity foundTrainingSectionEntity = findTrainingSectionEntityById(trainingSectionId);
		entity.setSection(foundTrainingSectionEntity);
		trainingMoveRepository.save(entity);
	}

	@Override
	public void updateTrainingMove(TrainingMoveDto dto) {
		TrainingMoveEntity foundTrainingMoveEntity = findTrainingMoveEntityById(dto.getId());
		foundTrainingMoveEntity.setName(dto.getName());
		foundTrainingMoveEntity.setRepetitionNumber(dto.getRepetitionNumber());
		foundTrainingMoveEntity.setSetNumber(dto.getSetNumber());
		trainingMoveRepository.save(foundTrainingMoveEntity);
	}
	
	private TrainingMoveEntity findTrainingMoveEntityById(UUID id) {
		return trainingMoveRepository.findById(id).orElseThrow(() -> new RuntimeException("Antrenman hareketi bulunamadi"));
	}

	@Override
	public void deleteTrainingMoveById(UUID id) {
		trainingMoveRepository.deleteById(id);
	}

	@Override
	public TrainingMoveDto findTrainingMoveById(UUID id) {
		TrainingMoveEntity entity = findTrainingMoveEntityById(id);
		return modelMapper.map(entity, TrainingMoveDto.class);
	}

	@Override
	public List<TrainingMoveDto> findTrainingMoveBySectionId(UUID sectionId) {
		return Arrays.asList(modelMapper.map(trainingMoveRepository.findBySectionId(sectionId).orElse(Collections.emptyList()), TrainingMoveDto[].class));
	}
	
	public static void main(String[] args) {
		TestDto dto = new TestDto();
		dto.a = "1";
		TestDto dto2 = new TestDto();
		dto2.a = "1";
		
		System.err.println("identityHashCode: " + System.identityHashCode(dto2));
		System.err.println("identityHashCode: " + System.identityHashCode(dto));
		System.err.println("hashCode: " + dto2.hashCode());
		System.err.println("hashCode: " + dto.hashCode());
		System.err.println("IsEqual: " + dto2.equals(dto));
		System.err.println("Operator IsEqual: " + (dto2 == dto));


		Set<TestDto> list = new HashSet<>();
		list.add(dto);
		list.add(dto2);
		System.err.println("HashSet Contains: " + list.contains(dto));
		System.err.println("HashSet: " + list.size());
		
		Map<TestDto, TestDto> map = new HashMap<TestDto, TestDto>();
		map.put(dto, dto);
		map.put(dto2, dto2);
		System.err.println("HashMap: " + map.size());
	}

}
