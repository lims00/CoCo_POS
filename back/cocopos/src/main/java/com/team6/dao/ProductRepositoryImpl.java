package com.team6.dao;

import com.team6.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

@Repository
public class ProductRepositoryImpl implements ProductRepository {
    private static final String INSERT_PRODUCT_QUERY =
            "INSERT INTO product(ProductId, ProductName, Price, StockQuantity, CategoryId) VALUES(?, ?, ?, ?, ?)";

    private static final String UPDATE_PRODUCT_BY_ID_QUERY =
            "UPDATE product SET (ProductName=?, Price=?) WHERE ProductID=?";

    private static final String GET_PRODUCT_BY_ID_QUERY =
            "SELECT * FROM product WHERE ProductID=?";

    private static final String DELETE_PRODUCT_BY_ID =
            "DELETE FROM product WHERE ProductID=?";

    private static final String GET_PRODUCTS_QUERY =
            "SELECT * FROM product";


    @Autowired
    private JdbcTemplate jdbcTemplate;

    /* 유효성 검사 추가 예정 */
    @Override
    public Product createProduct(Product product) {
        jdbcTemplate.update(INSERT_PRODUCT_QUERY,
                product.getProductId(),
                product.getProductName(),
                product.getPrice(),
                product.getStockQuantity(),
                product.getCategoryID());
        return product;
    }

    @Override
    public Product updateProduct(Product product) {
        jdbcTemplate.update(UPDATE_PRODUCT_BY_ID_QUERY,
                product.getProductName(),
                product.getPrice(),
                product.getProductId()
        );
        return product;
    }

    ;

    @Override
    public Product getById(int ProductID) {
        try {
            List<Product> products = jdbcTemplate.query(GET_PRODUCT_BY_ID_QUERY, (rs, rowNum) -> {
                return new Product(
                        rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        rs.getInt("Price"),
                        rs.getInt("StockQuantity"),
                        rs.getInt("CategoryID"));
            }, ProductID);

            if (products.isEmpty()) {
                // 해당 ID에 대한 제품이 없는 경우 예외 처리 또는 특정 값 반환 등을 수행
                return null; // 예시로 null 반환
            }

            return products.get(0); // 결과가 있을 경우 첫 번째 제품 반환
        } catch (EmptyResultDataAccessException ex) {
            // 예외 처리를 강화하여 더 의미 있는 오류 메시지를 제공하세요
            System.err.println("No product found for ID: " + ProductID);
            return null;
        }
    }
    @Override
    public String deleteById(int productId) {
        jdbcTemplate.update(DELETE_PRODUCT_BY_ID, productId);
        return "product is deleted";
    }

    ;

    @Override
    public List<Product> allProducts() {
        return jdbcTemplate.query(GET_PRODUCTS_QUERY, (rs, rowNum) -> {
            return new Product(
                    rs.getInt("ProductID"),
                    rs.getString("ProductName"),
                    rs.getInt("Price"),
                    rs.getInt("StockQuantity"),
                    rs.getInt("CategoryID"));
        });
    }
}