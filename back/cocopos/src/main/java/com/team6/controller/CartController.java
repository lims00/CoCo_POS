package com.team6.controller;

import com.google.gson.Gson;
import com.team6.dao.*;
import com.team6.entity.CartItem;
import com.team6.entity.Customer;
import com.team6.entity.Membership;
import com.team6.entity.Product;
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
    CouponRepository couponRepository;

    @Autowired
    ProductRepository productRepository;

    @GetMapping("/customercart/{customerId}")
    public JSONObject customerCart(@PathVariable int customerId) {
        Membership membership = membershipRepository.getByCustomerId(customerId);
        Customer customer = customerRepository.getById(customerId);

        JSONObject info = new JSONObject();
        Gson gson = new Gson();


        info.put("customerName", customer.getFirstName() + ' ' + customer.getLastName());
        info.put("customerId", customer.getCustomerId());
        info.put("membershipLevel", membership.getLevelId());


        System.out.println(customer.getFirstName() + ' ' + customer.getLastName());
        System.out.println(membership.getLevelId());

        return info;
    }

    /*
    ProductID와 Quantity로 totalprice 및 상품 정보 돌려주는 (상품 번호, 상풍명, 수량, 단가, 가격 ) api
     */

    @PostMapping("/addtocart")
    public JSONObject addToCartByIdAndQuantity(int productId, int quantity) {
        JSONObject json = new JSONObject(); // Json Object 생성
        Product product = productRepository.getById(productId);
        int unitPrice = product.getPrice();

        json.put("productId", productId);
        json.put("productName", product.getPrice());
        json.put("quantity", quantity);
        json.put("unitPrice", unitPrice);
        json.put("totalPrice", unitPrice*quantity);
        return json;
    }

    /* 회원 id입력하면, 프로모션 정보알려주는 api */
    /* 할인 쿠폰 입력하면 가격 계산...(이건 그냥 front에서 처리해도 될듯) */
    /* 최근 거래 내역(주문번호,거래일, 총금액) d알려주는 api */
    /* 반품도 (최근 거래 내역과 동일한 정보 필요) 반품할 물건 알려주는 api */

}
