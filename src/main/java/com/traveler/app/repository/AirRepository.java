package com.traveler.app.repository;

import java.util.List;

import com.traveler.app.model.AirItem;

public interface AirRepository {
	int save(AirItem airItem);
	int deleteByUserId(int userId);
	int delete(int id);
	List<AirItem> findByUserId(int userId);
}
