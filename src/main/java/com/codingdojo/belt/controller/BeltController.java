package com.codingdojo.belt.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.codingdojo.belt.models.Comments;
import com.codingdojo.belt.models.Events;
import com.codingdojo.belt.models.Users;
import com.codingdojo.belt.service.UserService;
import com.codingdojo.belt.validator.UserValidator;

@Controller
	public class BeltController {
	private final UserService userService;
    private final UserValidator userValidator;
    

    public BeltController(UserService userService, UserValidator userValidator) {
        this.userService = userService;
        this.userValidator = userValidator;
    } 
		 @RequestMapping("/registration")
		 public String registerForm(@ModelAttribute("user") Users user) {
		 		return "login.jsp";
		 }
		 @RequestMapping("/login")
		 public String login() {
		 		return "login.jsp";
		 }
		 @PostMapping("/registration")
		 public String registerUser(@Valid @ModelAttribute("user") Users users, BindingResult result, HttpSession session) {
		     userValidator.validate(users, result);
			 if (result.hasErrors()) {
		         return "registration.jsp";
		     } else {
				Users u = userService.registerUser(users);
				session.setAttribute("userId", u.getId());
				return "redirect:/home";
		     }
	}		 
		 @PostMapping("/login")
		 public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) {
		     boolean isAuthenticated = userService.authenticateUser(email, password);
		     if(isAuthenticated) {
		    	 Users u = userService.findByEmail(email);
		    	 session.setAttribute("userId", u.getId());
		    	 return "redirect:/home";
		     } else {
		    	 model.addAttribute("error", "Ivalid Credentials. Pleasse Try Again");
		    	 return "login.jsp";
		     }
			 
}
		 @GetMapping("/home")
		 public String home(HttpSession session, Model model, @ModelAttribute("event") Events event) {
			 List<Events> events = userService.all();
			 model.addAttribute("events", events);	
		     Long userId = (Long) session.getAttribute("userId");
		     Users u = userService.findUserById(userId);
			 model.addAttribute("user", u);
			 return "homePage.jsp";
		 }
		 @RequestMapping("/logout")
		 public String logout(HttpSession session) {
		    session.invalidate();
		    return "redirect:/registration";
		 }
		 
		 @PostMapping("/create/events")
		 public String createEvent(@Valid @ModelAttribute("event") Events events, BindingResult result, HttpSession session) {
			 if (result.hasErrors()) {
		         return "registration.jsp";
		     } else {
		    	 Long id = (Long)session.getAttribute("userId");
			     Users u = userService.findUserById(id);
			     events.setUser(u);
		    	 userService.create(events);
				return "redirect:/home";
		     }
		 }
		  @RequestMapping("/events/{id}/edit")
		    public String edit(@PathVariable("id") Long id, Model model) {
		        Events events = userService.findEventById(id);
		        userService.create(events);
		        model.addAttribute("events", events);
		        return "edit.jsp";
		    }
		    @PostMapping("events/{id}/update")
		    public String update(@PathVariable("id") Long id, @Valid @ModelAttribute("events") Events events, BindingResult result) {
		        if (result.hasErrors()) {
		        	events.setId(id);
		            return "edit.jsp";
		        } else {
		        	events.setId(id);
		        	userService.create(events);
		            return "redirect:/home";
		        }
		    }
		    @RequestMapping("/delete/{id}")
		    public String destroy(@PathVariable("id") Long id) {
		    	userService.delete(id);
		    	return "redirect:/home";
		    }
		 
		    
		    @RequestMapping("/show/{id}")
		    public String show(@PathVariable("id") Long id, Model model) {
		    	Events event = userService.findEventById(id);
		        model.addAttribute("events", event);
		    	List<Comments> com = userService.allC();
		        model.addAttribute("comments", com);
		        return "event.jsp";
		    }
		    
		    @PostMapping("/comment")
		    public String create(@Valid @ModelAttribute("comments") Comments comment, BindingResult result) {
		        if (result.hasErrors()) {
		            return "new.jsp";
		        } else {
		            userService.createC(comment);
		            return "redirect:/home";
		        }
		    }
		 
}
		 
		 
		 
		


