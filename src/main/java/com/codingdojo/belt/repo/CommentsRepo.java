package com.codingdojo.belt.repo;

import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.codingdojo.belt.models.Comments;

@Repository
public interface CommentsRepo extends CrudRepository<Comments, Long> {
	List<Comments>findAll();
}
