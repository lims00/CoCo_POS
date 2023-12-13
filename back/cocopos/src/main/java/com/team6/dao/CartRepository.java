package com.team6.dao;

import com.team6.entity.Cart;

public interface CartRepository {
    boolean createCart(int customerId);


    Cart getCartByCartId(int cartId);
    Cart getCartByCustomerId(int customerId);

    int UpdateCartTotalPrice(int cartId, int addPrice);

}
