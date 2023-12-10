package com.team6.dao;

import com.team6.entity.CustomerCoupon;
import java.util.List;
public interface CustomerCouponRepository {
    List<CustomerCoupon> getCouponsById(int customerId);
}
