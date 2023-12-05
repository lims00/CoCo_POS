package com.team6.dao;

import com.team6.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

@Repository
public class ProductRepositoryImpl implements ProductRepository {
    private static final String INSERT_PRODUCT_QUERY =
            "INSERT INTO product(productID, name, description, price, discountedPrice";

    private static final String UPDATE_PRODUCT_BY_ID_QUERY =
            "UPDATE product SET (name=?, description=?, price=?, discountedPrice=?) WHERE productId=?";

    private static final String GET_PRODUCT_BY_ID_QUERY =
            "SELECT * FROM product WHERE productId=?";

    private static final String DELETE_PRODUCT_BY_ID =
            "DELETE FROM product WHERE productID=?";

    private static final String GET_PRODUCTS_QUERY =
            "SELECT * FROM product";


    @Autowired
    private JdbcTemplate jdbcTemplate;

    /* 유효성 검사 추가 예정 */
    @Override
    public Product saveProduct(Product product) {
        jdbcTemplate.update(INSERT_PRODUCT_QUERY,
                product.getProductId(),
                product.getName(),
                product.getDescription(),
                product.getPrice(),
                product.getDiscountedPrice());
        return product;
    }

    @Override
    public Product updateProduct(Product product) {
        jdbcTemplate.update(UPDATE_PRODUCT_BY_ID_QUERY,
                product.getName(),
                product.getDescription(),
                product.getPrice(),
                product.getDiscountedPrice(),
                product.getProductId());
        return product;
    }

    ;

    @Override
    public Product getById(int ProductID) {
        return jdbcTemplate.queryForObject(GET_PRODUCT_BY_ID_QUERY, (rs, rowNum) -> {
            return new Product(
                    rs.getInt("productId"),
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getInt("price"),
                    rs.getInt("discountedPrice"),
                    rs.getInt("stockQuantity"));
        });
    }

    ;

    @Override
    public String deleteById(int productId) {
        jdbcTemplate.update(DELETE_PRODUCT_BY_ID, productId);
        return "product is deleted";
    }

    ;

    @Override
    public List<Product> AllProducts() {
        return jdbcTemplate.query(GET_PRODUCTS_QUERY, (rs, rowNum) -> {
            return new Product(
                    rs.getInt("productId"),
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getInt("price"),
                    rs.getInt("discountedPrice"),
                    rs.getInt("stockQuantity"));
        });
    }
}