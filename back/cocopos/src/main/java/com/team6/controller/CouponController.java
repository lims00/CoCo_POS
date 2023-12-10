package com.team6.controller;

import com.team6.dao.CouponRepository;
import com.team6.entity.Coupon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin(origins = "http://localhost:3000")
public class CouponController {
    @Autowired
    CouponRepository couponRepository;

    @GetMapping("/coupon/{id}")
    public Coupon getCouponById(@PathVariable int id) {
        return couponRepository.getCouponById(id);
    }
}
