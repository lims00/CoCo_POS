package com.team6.controller;

import com.team6.dao.MembershipLevelRepository;
import com.team6.entity.MembershipLevel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin(origins="https://localhost:3000")
public class MembershipLevelController {
    @Autowired
    MembershipLevelRepository membershipLevelRepository;

    @PostMapping("/membershiplevel")
    public MembershipLevel createMembershipLevel(@RequestBody MembershipLevel membershipLevel) {
        return membershipLevelRepository.createMembershipLevel(membershipLevel);
    }

    @GetMapping("/membershiplevel/{id}")
    public MembershipLevel getMembershipLevel(@PathVariable int id) {
        return membershipLevelRepository.getMembershipLevelById(id);
    }
}
