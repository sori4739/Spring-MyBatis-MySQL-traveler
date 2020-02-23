package com.traveler.app.repository;

import java.util.List;

import com.traveler.app.model.Keep;

public interface KeepRepository {
	int save(Keep keep);
	int delete(int userId,int blogId);
	List<Keep> findAll();
	List<Keep> findByUserId(int userId);
	
}
