package com.sessevmez.institutemanagement.service;

import java.util.List;

import org.keycloak.representations.idm.UserRepresentation;

public interface KeycloakUserService {

    List<UserRepresentation> findByUsername(String username);

    UserRepresentation findByUserId(String userId);
    
    void createAttribute(String userId, String key, String value);

}