package com.codingdojo.belt.service;


import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.belt.models.Comments;
import com.codingdojo.belt.models.Events;
import com.codingdojo.belt.models.Users;
import com.codingdojo.belt.repo.CommentsRepo;
import com.codingdojo.belt.repo.EventsRepo;
import com.codingdojo.belt.repo.UserRepo;


@Service
public class UserService {
	@Autowired
    private UserRepo userRepo;
	@Autowired
    private EventsRepo eventsRepo;
	@Autowired
	private CommentsRepo commentRepo;
    
    public UserService(UserRepo userRepo) {
        this.userRepo = userRepo;
    }

    public Events create(Events events) {
        return eventsRepo.save(events);
    }
    public Comments createC(Comments comment) {
        return commentRepo.save(comment);
    }
    public List<Events> all() {
        return eventsRepo.findAll();
    }
    public List<Comments> allC() {
        return commentRepo.findAll();
    }
    
    // register user and hash their password
    public Users registerUser(Users user) {
        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashed);
        return userRepo.save(user);
    }
    
    // find user by email
    public Users findByEmail(String email) {
        return userRepo.findByEmail(email);
    }
    
    // find user by id
    public Users findUserById(Long id) {
    	Optional<Users> u = userRepo.findById(id);
    	
    	if(u.isPresent()) {
            return u.get();
    	} else {
    	    return null;
    	}
    }
    
    public Events findEventById(Long id) {
    	Optional<Events> u = eventsRepo.findById(id);
    	
    	if(u.isPresent()) {
            return u.get();
    	} else {
    	    return null;
    	}
    }
    public Events delete(Long id) {
        eventsRepo.deleteById(id);
		return null;
    }
    
    // authenticate user
    public boolean authenticateUser(String email, String password) {
        // first find the user by email
        Users user = userRepo.findByEmail(email);
        // if we can't find it by email, return false
        if(user == null) {
            return false;
        } else {
            // if the passwords match, return true, else, return false
            if(BCrypt.checkpw(password, user.getPassword())) {
                return true;
            } else {
                return false;
            }
        }
    }
}

