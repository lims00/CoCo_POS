package com.team6.dao;
import com.team6.entity.Category;
import com.team6.entity.Coupon;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

@Repository
public class CouponRepositoryImpl implements CouponRepository {
    @Autowired
    JdbcTemplate jdbcTemplate;

    private static final String GET_COUPON_BY_ID_QUERY =
            "SELECT * FROM coupon WHERE CouponID=?";

    @Override
    public Coupon getCouponById(int couponId) {
        return jdbcTemplate.queryForObject(GET_COUPON_BY_ID_QUERY, (rs, rNum) -> {
            return new Coupon(
                    rs.getInt("CouponID"),
                    rs.getInt("DiscountPrice")
            );
        }, couponId);
    }
}
