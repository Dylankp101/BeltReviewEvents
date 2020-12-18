package com.codingdojo.belt.repo;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.belt.models.Events;


@Repository
public interface EventsRepo extends CrudRepository<Events, Long> {
	List<Events>findAll();
}
