package com.team6.dao;

import com.team6.entity.Membership;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;


@Repository
public class MembershipRepositoryImpl implements MembershipRepository {
    @Autowired
    JdbcTemplate jdbcTemplate;

    private static final String INSERT_MEMBERSHIP_QUERY =
            "INSERT INTO membership (LevelID, CustomerID, JoinDate, ExpiryDate, Status) VALUES (?, ?, ?, ?, ?)";

    @Override
    public Membership createMembership(Membership membership) {
        jdbcTemplate.update(INSERT_MEMBERSHIP_QUERY,
                membership.getLevelId(),
                membership.getCustomerId(),
                membership.getJoinDate(),
                membership.getExpiryDate(),
                membership.getStatus());
        return membership;
    }

}
