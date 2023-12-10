package com.team6.dao;

import com.team6.entity.CustomerCoupon;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CustomerCouponRepositoryImpl implements CustomerCouponRepository {
    @Autowired
    JdbcTemplate jdbcTemplate;

    private static final String GET_COUPONS_BY_ID_QUERY =
            "SELECT * FROM customercoupon WHERE CustomerID=?";

    @Override
    public List<CustomerCoupon> getCouponsById(int customerId) {
        return jdbcTemplate.query(GET_COUPONS_BY_ID_QUERY, (rs, rowNum)->{
            return new CustomerCoupon(
                    rs.getInt("CustomerID"),
                    rs.getInt("CouponID"),
                    rs.getBoolean("IsUsed")
            );
        }, customerId);
    }
}
