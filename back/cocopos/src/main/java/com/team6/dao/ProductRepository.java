package com.team6.dao;

import com.team6.entity.Product;

import java.util.List;

public interface ProductRepository {
    /* 상품 생성 후 DB에 저장*/
    Product saveProduct(Product product);
    /* 상품 정보 수정 후 DB에 저장 */
    Product updateProduct(Product product);

    /* ID로 상품 검색 */
    Product getById(int productId);
    /* ID로 상품 삭제 */
    String deleteById(int productId);

    /* 모든 상품 불러오기 */
    List<Product> AllProducts();
}
