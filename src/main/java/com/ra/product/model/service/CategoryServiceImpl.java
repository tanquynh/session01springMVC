package com.ra.product.model.service;

import com.ra.product.model.dao.CategoryDAO;
import com.ra.product.model.entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CategoryServiceImpl implements CategoryService{
    @Autowired
    private CategoryDAO categoryDAO;
    @Override
    public List<Category> getAll() {
        return categoryDAO.getAll();
    }

    @Override
    public boolean save(Category category) {
        return categoryDAO.save(category);
    }

    @Override
    public Category getById(Integer categoryId) {
        return categoryDAO.getById(categoryId);
    }

    @Override
    public boolean update(Category category, Integer categoryId) {
        return categoryDAO.update(category, categoryId);
    }

    @Override
    public boolean delete(Integer categoryId) {
        return delete(categoryId);
    }
}
