package com.team6.dao;


import com.team6.entity.MembershipLevel;

public interface MembershipLevelRepository {
    MembershipLevel createMembershipLevel(MembershipLevel membershipLevel);

    MembershipLevel getMembershipLevelById(int id);
}
