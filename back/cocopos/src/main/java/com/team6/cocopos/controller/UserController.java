package com.team6.cocopos.controller;
import com.team6.cocopos.dao.UserRepository;
import com.team6.cocopos.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin(origins = "http://localhost:3000")
public class UserController {
    @Autowired
    UserRepository userRepository;

    @PostMapping("/user")
    public User addUser(@RequestBody User user) {
        return userRepository.saveUser(user);
    }

    @PutMapping("/user")
    public User updateUser(@RequestBody User user) {
        return userRepository.updateUser(user);
    }

    @GetMapping("/user/{id}")
    public User getUser(@PathVariable("id") int id){
        return userRepository.getById(id);
    }

    @GetMapping("/users")
    public List<User> getUsers(){
        return userRepository.allUsers();
    }

}