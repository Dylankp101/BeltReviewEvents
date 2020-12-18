package com.codingdojo.belt.repo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.codingdojo.belt.models.Users;


@Repository
public interface UserRepo extends CrudRepository<Users, Long> {
    Users findByEmail(String email);
}
