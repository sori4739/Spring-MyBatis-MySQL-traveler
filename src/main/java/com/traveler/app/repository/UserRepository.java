package com.traveler.app.repository;

import com.traveler.app.model.User;

public interface UserRepository {
	User findByUsername(String username);
	int save(User user);
	int update(User user);
}
