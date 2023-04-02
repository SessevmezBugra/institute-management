package com.srb.institutemanagement.service.impl;

import java.util.List;

import org.keycloak.admin.client.Keycloak;
import org.keycloak.admin.client.resource.UsersResource;
import org.keycloak.representations.idm.UserRepresentation;
import org.springframework.stereotype.Service;

import com.srb.institutemanagement.model.KeycloakAdminClientConfig;
import com.srb.institutemanagement.service.KeycloakResource;
import com.srb.institutemanagement.service.KeycloakUserService;


@Service
public class KeycloakUserServiceImpl extends KeycloakResource implements KeycloakUserService {

    public KeycloakUserServiceImpl(Keycloak keycloak, KeycloakAdminClientConfig keycloakAdminClientConfig) {
        super(keycloak, keycloakAdminClientConfig);
    }


    @Override
    public List<UserRepresentation> findByUsername(String username) {
        UsersResource usersResource = getUsersResource();
        return usersResource.search(username, null, null, null, true, 0, 10, true, false);
    }

    @Override
    public UserRepresentation findByUserId(String userId) {
        UsersResource usersResource = getUsersResource();
        return usersResource.get(userId).toRepresentation();
    }


	@Override
	public void createAttribute(String userId, String key, String value) {
		UsersResource usersResource = getUsersResource();
		usersResource.get(userId).update(findByUserId(userId).singleAttribute(key, value));
	}
    
}