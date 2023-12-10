package com.team6.dao;

import com.team6.entity.Membership;
import com.team6.entity.MembershipLevel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MembershipLevelRepositoryImpl implements MembershipLevelRepository{
    @Autowired
    private JdbcTemplate jdbcTemplate;

    private final String CREATE_MEMBERSHIPLEVEL_QUERY =
            "INSERT INTO membershiplevel(LevelID, LevelName, DiscountRate) VALUES (?, ?, ?)";

    private final String GET_MEMBERSHIPLEVEL_BY_ID_QUERY =
            "SELECT * FROM membershiplevel WHERE LevelID = ?";
    @Override
    public MembershipLevel createMembershipLevel(MembershipLevel membershipLevel) {
        jdbcTemplate.update(CREATE_MEMBERSHIPLEVEL_QUERY,
                membershipLevel.getLevelId(),
                membershipLevel.getLevelName(),
                membershipLevel.getDiscountRate());
        return membershipLevel;
    }

    @Override
    public MembershipLevel getMembershipLevelById(int id) {
        return jdbcTemplate.queryForObject(GET_MEMBERSHIPLEVEL_BY_ID_QUERY, (rs, rowNum) -> {
            return new MembershipLevel(rs.getInt("LevelID"),
                    rs.getString("LevelName"),
                    rs.getInt("DiscountRate"));
        }, id);
    }
}
