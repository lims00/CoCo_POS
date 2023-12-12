package com.team6.controller;

import com.google.gson.Gson;
import com.team6.dao.*;
import com.team6.entity.*;
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
    }

    /*
    ProductID와 Quantity로 totalprice 및 상품 정보 돌려주는 (상품 번호, 상풍명, 수량, 단가, 가격 ) api
     */



    /* POST 요청 보낼 때 customerId, productId, quantity를 보내주면,
        1.cartItem 생성
        2.cart에 cartItem 추가 ( cartItem이 cart를 FK로 참조하게 됨)
        3.현재 Cart에 담긴 물건들의 총 가격을 새로 담긴 물건 가격만큼 업데이트
        4. 리턴 (productId, productName, quantity, unitPrice, totalProductPrice, totalPrice)
        위에서 totalPrice는 해당 물건 가격 * 총 갯수, totalPrice는 카트에 담긴 모든 물건들의 가격 전부 합친 것
     */
    @PostMapping("/addtocart")
    public JSONObject addToCartByIdAndQuantity(int customerId, int productId, int quantity) {
        JSONObject json = new JSONObject(); // Json Object 생성
        Product product = productRepository.getById(productId);
        int unitPrice = product.getPrice();
        int totalProductPrice = unitPrice * quantity;
        Cart cart = cartRepository.getCartByCustomerId(customerId);
        cartItemRepository.createCartItem(cart.getCartId(), customerId, quantity);
        cartRepository.UpdateCartTotalPrice(totalProductPrice, cart.getCartId());



        json.put("productId", productId);
        json.put("productName", product.getPrice());
        json.put("quantity", quantity);
        json.put("unitPrice", unitPrice);
        json.put("totalProductPrice", totalProductPrice);
        json.put("totalPrice", cart.getTotalPrice());
        return json;
    }

    /* 할인 쿠폰 입력하면 가격 계산...(이건 그냥 front에서 처리해도 될듯) */
    /* 최근 거래 내역(주문번호,거래일, 총금액) d알려주는 api */


    /* 반품도 (최근 거래 내역과 동일한 정보 필요) 반품할 물건 알려주는 api */

}
