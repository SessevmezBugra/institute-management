package com.srb.institutemanagement.service.impl;

import java.util.List;

import org.keycloak.admin.client.Keycloak;
import org.keycloak.admin.client.resource.UserResource;
import org.keycloak.admin.client.resource.UsersResource;
import org.keycloak.representations.idm.GroupRepresentation;
import org.springframework.stereotype.Service;

import com.srb.institutemanagement.model.KeycloakAdminClientConfig;
import com.srb.institutemanagement.service.KeycloakGroupService;
import com.srb.institutemanagement.service.KeycloakResource;

@Service
public class KeycloakGroupServiceImpl extends KeycloakResource implements KeycloakGroupService {

    public KeycloakGroupServiceImpl(Keycloak keycloak, KeycloakAdminClientConfig keycloakAdminClientConfig) {
        super(keycloak, keycloakAdminClientConfig);
    }

    @Override
    public void addUser(String groupId, String userId) {
        UsersResource usersResource = getUsersResource();
        UserResource userResource = usersResource.get(userId);
        userResource.joinGroup(groupId);
    }

    @Override
    public void removeUser(String groupId, String userId) {

    }

    @Override
    public List<GroupRepresentation> findAll() {
        return getGroupResource().groups();
    }
}