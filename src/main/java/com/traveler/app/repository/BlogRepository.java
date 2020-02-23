package com.traveler.app.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.traveler.app.model.Blog;

@Repository
public interface BlogRepository {
	int save(Blog items);
	List<Blog> findByTourId(int tourId);
	Blog findById(int id);
}
