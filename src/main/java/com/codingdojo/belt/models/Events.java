package com.codingdojo.belt.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;


@Entity
@Table(name="events")
public class Events {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String date;
    private String state;
    private String location;
    @Column(updatable = false)
    private Date createdAt;
    private Date updatedAt;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="users_id") 
    private Users user;
    
    
    @OneToMany(mappedBy="event", fetch = FetchType.LAZY)
    private List<Comments> comments;
    
    
    public Events() {
    	
    }
	

	public Events(Long id, String name, String date, String state, String location, Users user) {
		this.id = id;
		this.name = name;
		this.date = date;
		this.state = state;
		this.location = location;
		this.user = user;
	}


	public Long getId() {
		return id;
	}






	public void setId(Long id) {
		this.id = id;
	}






	public String getName() {
		return name;
	}






	public void setName(String name) {
		this.name = name;
	}






	public String getDate() {
		return date;
	}






	public void setDate(String date) {
		this.date = date;
	}






	public String getState() {
		return state;
	}






	public void setState(String state) {
		this.state = state;
	}






	public String getLocation() {
		return location;
	}






	public void setLocation(String location) {
		this.location = location;
	}






	public Date getCreatedAt() {
		return createdAt;
	}






	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}






	public Date getUpdatedAt() {
		return updatedAt;
	}






	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}






	public Users getUser() {
		return user;
	}






	public void setUser(Users user) {
		this.user = user;
	}






	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
    
}
