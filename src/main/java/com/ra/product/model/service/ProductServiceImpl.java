package com.ra.product.model.service;

import com.ra.product.model.dao.ProductDAO;
import com.ra.product.model.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ProductServiceImpl implements ProductService{
    @Autowired
    private ProductDAO productDAO;
    @Override
    public List<Product> getAll() {
        return productDAO.getAll();
    }

    @Override
    public boolean save(Product product) {
        return productDAO.save(product);
    }

    @Override
    public Product getById(Integer productId) {
        return productDAO.getById(productId);
    }

    @Override
    public boolean update(Product product, Integer productId) {
        return productDAO.update(product, productId);
    }

    @Override
    public boolean delete(Integer productId) {
        return productDAO.delete(productId);
    }
}
