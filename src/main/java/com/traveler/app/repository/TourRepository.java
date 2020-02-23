package com.traveler.app.repository;

import java.util.List;

import com.traveler.app.model.Tour;

public interface TourRepository {
	List<Tour> findByCityId(int cityId);
	List<Tour> findByAll();
}
