package com.team6.dao;

import com.team6.entity.Promotion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PromotionRepositoryImpl implements PromotionRepository {
    @Autowired
    JdbcTemplate jdbcTemplate;

    private static final String GET_PROMOTION_BY_ID_QUERY =
            "SELECT * FROM promotion WHERE PromotionID = ?";

    @Override
    public Promotion getPromotionById(int promotionId) {
        return jdbcTemplate.queryForObject(GET_PROMOTION_BY_ID_QUERY, (rs, rowNum) -> {
            return new Promotion(
                    rs.getInt("PromotionID"),
                    rs.getString("PromotionName"),
                    rs.getString("StartDate"),
                    rs.getString("EndDate"),
                    rs.getString("PromotionDescription"));
            }, promotionId);
    };
}
