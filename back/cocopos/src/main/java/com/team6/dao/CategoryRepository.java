package com.team6.dao;

import com.team6.entity.Category;
import java.util.List;

/*
Category Class:
    int CategoryID
    String CategoryName
 */

public interface CategoryRepository {
    Category createCategory(Category category);

    Category UpdateCategory(Category category);

    Category getByName(String categoryName);

    String deleteById(int categoryId);

    List<Category> allCategories();
}
