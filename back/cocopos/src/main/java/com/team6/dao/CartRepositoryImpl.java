package com.team6.dao;

import com.team6.entity.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CartRepositoryImpl implements CartRepository{
    @Autowired
    JdbcTemplate jdbcTemplate;

    private static final String INSERT_CART_QUERY =
            "INSERT INTO cart (CustomerID) VALUES (?)";

    private static final String GET_CART_BY_CART_ID_QUERY =
            "SELECT * FROM cart WHERE CartID=?";
    private static final String GET_CART_BY_CUSTOMER_ID =
            "SELECT * FROM cart WHERE CustomerID=?";

    private static final String UPDATE_TOTAL_PRICE_QUERY =
            "UPDATE cart SET(TotalPrice = ?) WHERE CartID=?";

    @Override
    public boolean createCart(int customerId) {
        jdbcTemplate.update(INSERT_CART_QUERY, customerId);
        return true;
    }


    @Override
    public Cart getCartByCartId(int cartId) {
        return jdbcTemplate.queryForObject(GET_CART_BY_CART_ID_QUERY, (rs, rowNum) -> {
            return new Cart(
                    rs.getInt("CartID"),
                    rs.getInt("CustomerID"),
                    rs.getInt("TotalPrice")
            );
        }, cartId);
    }
    @Override
    public Cart getCartByCustomerId(int customerId) {
        return jdbcTemplate.queryForObject(GET_CART_BY_CUSTOMER_ID, (rs, rowNum) -> {
            return new Cart(
                    rs.getInt("CartID"),
                    rs.getInt("CustomerID"),
                    rs.getInt("TotalPrice")
            );
        }, customerId);
    }



    @Override
    public int UpdateCartTotalPrice(int cartId, int addPrice){
        Cart cart = getCartByCartId(cartId);
        int totalPrice = cart.getTotalPrice();
        totalPrice = totalPrice + addPrice;
        jdbcTemplate.update(UPDATE_TOTAL_PRICE_QUERY, totalPrice, cartId);
        return totalPrice;
    }

}
