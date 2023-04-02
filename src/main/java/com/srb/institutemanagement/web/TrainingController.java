package com.srb.institutemanagement.web;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.srb.institutemanagement.constant.ApiPath;
import com.srb.institutemanagement.dto.TrainingDto;
import com.srb.institutemanagement.dto.TrainingMoveDto;
import com.srb.institutemanagement.dto.TrainingSectionDto;
import com.srb.institutemanagement.entity.TrainingEntity;
import com.srb.institutemanagement.service.TrainingService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping(ApiPath.TrainingCtrl.CTRL)
@RequiredArgsConstructor
public class TrainingController implements SecuredRestController{

	private final TrainingService trainingService;
	
	@RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<Void> createTraining(@RequestBody TrainingDto dto){
		trainingService.createTraining(dto);
        return ResponseEntity.ok().build();
    }
	
	@RequestMapping(method = RequestMethod.PUT)
    public ResponseEntity<TrainingEntity> updateTraining(@RequestBody TrainingDto dto){
		trainingService.updateTraining(dto);
		return ResponseEntity.ok().build();
    }
	
	@RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<List<TrainingDto>> getTrainings(@RequestParam Optional<String> userId){
		
        return ResponseEntity.ok(trainingService.findTrainingByUserId(userId.orElse("")));
    }
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<TrainingDto> getTraining(@PathVariable UUID id){
        return ResponseEntity.ok(trainingService.findTrainingById(id));
    }
	
	@RequestMapping(value = "/{trainingId}/section", method = RequestMethod.POST)
    public ResponseEntity<Void> createTrainingSection(@PathVariable UUID trainingId, @RequestBody TrainingSectionDto trainingSectionDto){
		trainingService.createTrainingSection(trainingId, trainingSectionDto);
		return ResponseEntity.ok().build();
    }
	
	@RequestMapping(value = "/{trainingId}/section", method = RequestMethod.PUT)
    public ResponseEntity<Void> updateTrainingSection(@RequestBody TrainingSectionDto trainingSectionDto){
		trainingService.updateTrainingSection(trainingSectionDto);
		return ResponseEntity.ok().build();
    }
	
	@RequestMapping(value = "/{trainingId}/section", method = RequestMethod.GET)
    public ResponseEntity<List<TrainingSectionDto>> getTrainingSections(@PathVariable UUID trainingId){
        return ResponseEntity.ok(trainingService.findTrainingSectionByTrainingId(trainingId));
    }
	
	@RequestMapping(value = "/{trainingId}/section/{sectionId}/move", method = RequestMethod.POST)
    public ResponseEntity<Void> createTrainingMove(@PathVariable UUID sectionId, @RequestBody TrainingMoveDto trainingMoveDto){
		trainingService.createTrainingMove(sectionId, trainingMoveDto);
		return ResponseEntity.ok().build();
    }
	
	@RequestMapping(value = "/{trainingId}/section/{sectionId}/move", method = RequestMethod.PUT)
    public ResponseEntity<Void> updateTrainingMove(@RequestBody TrainingMoveDto trainingMoveDto){
		trainingService.updateTrainingMove(trainingMoveDto);
		return ResponseEntity.ok().build();
    }
	
	@RequestMapping(value = "/{trainingId}/section/{sectionId}/move", method = RequestMethod.GET)
    public ResponseEntity<List<TrainingMoveDto>> getTrainingMoves(@PathVariable UUID sectionId){
        return ResponseEntity.ok(trainingService.findTrainingMoveBySectionId(sectionId));
    }
	
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteTraining(@PathVariable UUID id){
		trainingService.deleteTrainingById(id);
        return ResponseEntity.ok().build();
    }
	
	@RequestMapping(value = "/{trainingId}/section/{sectionId}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteTrainingSection(@PathVariable UUID sectionId){
		trainingService.deleteTrainingSectionById(sectionId);
        return ResponseEntity.ok().build();
    }
	
	@RequestMapping(value = "/{trainingId}/section/{sectionId}/move/{moveId}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteTrainingMove(@PathVariable UUID moveId){
		trainingService.deleteTrainingMoveById(moveId);
        return ResponseEntity.ok().build();
    }
	
	
}