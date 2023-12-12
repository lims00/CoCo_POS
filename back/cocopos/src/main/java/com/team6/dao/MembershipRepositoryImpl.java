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

    private static final String GET_MEMBERSHIP_BY_CUSTOMERID_QUERY =
            "SELECT * FROM membership WHERE CustomerID=?";

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

    @Override
    public Membership getByCustomerId(int customerId) {
        return jdbcTemplate.queryForObject(GET_MEMBERSHIP_BY_CUSTOMERID_QUERY, (rs, rowNum) -> {
            return new Membership(rs.getInt("LevelID"),
                    rs.getInt("CustomerID"),
                    rs.getString("JoinDate"),
                    rs.getString("ExpiryDate"),
                    rs.getString("Status"));
        }, customerId);
    }
}
