package com.team6.dao;
import com.team6.entity.CartItem;
public interface CartItemRepository {

    void createCartItem(int cartId, int productId, int quantity);
}
