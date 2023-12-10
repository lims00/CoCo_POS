package com.team6.controller;

import com.team6.dao.MembershipRepository;
import com.team6.entity.Membership;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(origins="https://localhost:3000")
public class MembershipController {
    @Autowired
    MembershipRepository membershipRepository;

    @PostMapping("/membership")
    public Membership createMembership(@RequestBody Membership membership) {
        return membershipRepository.createMembership(membership);
    }

}
