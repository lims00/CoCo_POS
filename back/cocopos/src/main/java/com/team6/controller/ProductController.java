package com.team6.controller;
import com.team6.dao.ProductRepository;
import com.team6.entity.Product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin(origins = "http://localhost:3000")
public class ProductController {
    @Autowired
    ProductRepository productRepository;

    @PostMapping("/product")
    public Product addProduct(@RequestBody Product product) {
        return productRepository.saveProduct(product);
    }

    @PutMapping("/product")
    public Product updateProduct(@RequestBody Product product) {
        return productRepository.updateProduct(product);
    }

    @GetMapping("/product/{id}")
    public Product getProduct(@PathVariable("id") int id) {
        return productRepository.getById(id);
    }

    @GetMapping("/products")
    public List<Product> getProducts() {
        return productRepository.allProducts();
    }
}
