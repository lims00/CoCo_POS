package com.team6.controller;

import com.team6.dao.*;
import com.team6.dto.AddToCartInput;
import com.team6.dto.AddToCartOutput;
import com.team6.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.json.simple.JSONObject;


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

    @Autowired
    PromotionRepository promotionRepository;

    @Autowired
    CartItemRepository cartItemRepository;


    @GetMapping("/customercart/{customerId}")
    public JSONObject customerCart(@PathVariable int customerId) {
        JSONObject json = new JSONObject();

        Membership membership = membershipRepository.getByCustomerId(customerId);
        Customer customer = customerRepository.getById(customerId);
        Promotion promotion = promotionRepository.getPromotionById(1);
        cartRepository.createCart(customerId);


        json.put("customerName", customer.getFirstName() + ' ' + customer.getLastName());
        json.put("customerId", customer.getCustomerId());
        json.put("membershipLevel", membership.getLevelId());
        json.put("promotionName", promotion.getPromotionName());
        json.put("promotionDesc", promotion.getPromotionDescription());

        return json;
    };

    /*
        POST 요청 보낼 때 customerId, productId, quantity를 보내주면,
        1.cartItem 생성
        2.cart에 cartItem 추가 ( cartItem이 cart를 FK로 참조하게 됨)
        3.현재 Cart에 담긴 물건들의 총 가격을 새로 담긴 물건 가격만큼 업데이트
        4.(productId, productName, quantity, unitPrice, totalProductPrice, totalPrice) 반환
        위에서 totalPrice는 해당 물건 가격 * 총 갯수, totalPrice는 카트에 담긴 모든 물건들의 가격 전부 합친 것
     */
    @PostMapping("/addtocart")
    public AddToCartOutput addToCartByIdAndQuantity(@RequestBody AddToCartInput addtocartinput) {
        Product product = productRepository.getById(addtocartinput.getProductId());
        int unitPrice = product.getPrice();
        int totalProductPrice = unitPrice * addtocartinput.getQuantity();

        Cart cart = cartRepository.getCartByCustomerId(addtocartinput.getCustomerId());
        cartItemRepository.createCartItem(cart.getCartId(), addtocartinput.getProductId(), addtocartinput.getQuantity());


        return new AddToCartOutput(
                product.getProductId(),
                product.getProductName(),
                addtocartinput.getQuantity(),
                unitPrice,
                totalProductPrice,
                cartRepository.UpdateCartTotalPrice(cart.getCartId(), totalProductPrice));
    }
}
