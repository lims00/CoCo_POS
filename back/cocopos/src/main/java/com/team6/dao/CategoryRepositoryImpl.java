package com.team6.dao;

import com.team6.dao.CategoryRepository;
import com.team6.entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

@Repository
public class CategoryRepositoryImpl implements CategoryRepository {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    private static final String INSERT_CATEGORY_QUERY =
            "INSERT INTO category (categoryId, categoryName) VALUES(?, ?)";

    private static final String UPDATE_CATEGORY_BY_ID_QUERY =
            "UPDATE category SET (category Name=?) WHERE categoryId=?";

    private static final String GET_CATEGORY_BY_ID_QUERY =
            "SELECT * FROM category WHERE categoryId=?";

    private static final String GET_CATEGORY_BY_NAME_QUERY =
            "SELECT * FROM category WHERE categoryName=?";

    private static final String DELETE_CATEGORY_BY_ID_QUERY =
            "DELETE FROM category WHERE category_id=?";

    private static final String GET_CATEGORIES_QUERY =
            "SELECT * FROM category";

    @Override
    public Category saveCategory(Category category) {
        jdbcTemplate.update(INSERT_CATEGORY_QUERY,
                category.getCategoryId(),
                category.getCategoryName());
        return category;
    }

    @Override
    public Category UpdateCategory(Category category) {
        jdbcTemplate.update(UPDATE_CATEGORY_BY_ID_QUERY,
                category.getCategoryId(),
                category.getCategoryName()
        );
        return category;
    }

    @Override
    public Category getByName(String categoryName) {
            return jdbcTemplate.queryForObject(GET_CATEGORY_BY_NAME_QUERY, (rs, rowNum) -> {
            return new Category(
                    rs.getInt("CategoryID"),
                    rs.getString("CategoryName")
            );
        });
    }

    @Override
    public String deleteById(int categoryId) {
        jdbcTemplate.update(DELETE_CATEGORY_BY_ID_QUERY, categoryId);
        return "category is deleted";
    }

    @Override
    public List<Category> allCategories() {
        return jdbcTemplate.query(GET_CATEGORIES_QUERY, (rs, rowNum) -> {
            return new Category(
                    rs.getInt("CategoryID"),
                    rs.getString("CategoryName")
            );
        });
    }
}
