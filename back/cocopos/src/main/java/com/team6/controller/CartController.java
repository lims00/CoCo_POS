package com.team6.controller;

import com.google.gson.Gson;
import com.team6.dao.*;
import com.team6.entity.Cart;
import com.team6.entity.CustomerCoupon;
import com.team6.entity.Customer;
import com.team6.entity.Membership;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.util.List;


@RestController
@CrossOrigin(origins="https://localhost:3000")
public class CartController {
    @Autowired
    CartRepository cartRepository;

    @Autowired
    CustomerRepository customerRepository;

    @Autowired
    MembershipRepository membershipRepository;

    @Autowired
    CustomerCouponRepository customerCouponRepository;

    @GetMapping("/customercart/{customerId}")
    public JSONObject customerCart(@PathVariable int customerId) {
        Membership membership = membershipRepository.getByCustomerId(customerId);
        Customer customer = customerRepository.getById(customerId);
        List<CustomerCoupon> customercoupons = customerCouponRepository.getCouponsById(customerId);

        JSONObject info = new JSONObject();
        JSONArray coupons = new JSONArray();
        Gson gson = new Gson();


        info.put("customerName", customer.getFirstName() + ' ' + customer.getLastName());
        info.put("customerId", customer.getCustomerId());
        info.put("membershipLevel", membership.getLevelId());


        System.out.println(customer.getFirstName() + ' ' + customer.getLastName());
        System.out.println(membership.getLevelId());
        for (int i=0 ; i < customercoupons.size() ; i++){
            System.out.println(customercoupons.get(i));
            coupons.add(gson.toJson(customercoupons.get(i)));
        }
        info.put("coupons", coupons);

        return info;
    }

}
