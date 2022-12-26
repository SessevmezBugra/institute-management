package com.sessevmez.institutemanagement.service;
import org.keycloak.representations.idm.GroupRepresentation;

import java.util.List;

public interface KeycloakGroupService {

    void addUser(String group, String username);

    void removeUser(String group, String username);

    List<GroupRepresentation> findAll();
}