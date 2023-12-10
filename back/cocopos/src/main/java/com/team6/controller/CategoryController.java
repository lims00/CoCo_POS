package com.team6.controller;
import com.team6.dao.CategoryRepository;
import com.team6.entity.Category;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin(origins = "http://localhost:3000")
public class CategoryController {
    @Autowired
    CategoryRepository categoryRepository;

    @PostMapping("/category")
    public Category addCategory(@RequestBody Category category) {
        return categoryRepository.createCategory(category);
    }

    @PutMapping("/category")
    public Category updateCategory(@RequestBody Category category) {
        return categoryRepository.UpdateCategory(category);
    }

    @GetMapping("/category/{name}")
    public Category getCategory(@PathVariable("name") String name) {
        return categoryRepository.getByName(name);
    }

    @DeleteMapping("/category/{id}")
    public String deleteCategory(@PathVariable("id") int id) {
        return categoryRepository.deleteById(id);
    }

    @GetMapping("/categories")
    public List<Category> getCategories() {
        return categoryRepository.allCategories();
    }
}
