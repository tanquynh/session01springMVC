package com.ra.product.model.dao;

import com.ra.product.model.entity.Category;
import com.ra.product.utils.ConnectionDB;
import org.springframework.stereotype.Repository;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
@Repository
public class CategoryDAOImpl implements CategoryDAO{
    @Override
    public List<Category> getAll() {
        Connection connection = null;
        List<Category> categoryList = new ArrayList<>();
        try {
            connection = ConnectionDB.openConnection();
            CallableStatement callableStatement = connection.prepareCall("{call getAllCategories()}");
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                Category category = new Category();
                category.setId(resultSet.getInt("id"));
                category.setName(resultSet.getString("name"));
                category.setStatus(resultSet.getBoolean("status"));
                categoryList.add(category);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectionDB.closeConnection(connection);
        }
        return categoryList;
    }

    @Override
    public boolean save(Category category) {
        Connection connection = null;

        try {
            connection = ConnectionDB.openConnection();
            CallableStatement callableStatement = connection.prepareCall("{call addCategory(?, ?)}");
            callableStatement.setString(1, category.getName());
            callableStatement.setBoolean(2, category.isStatus());
            int check = callableStatement.executeUpdate();
            if (check > 0) {
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectionDB.closeConnection(connection);
        }
        return false;
    }

    @Override
    public Category getById(Integer categoryId) {
        Category category = new Category();
        Connection connection = null;
        try {
            connection = ConnectionDB.openConnection();
            CallableStatement callableStatement = connection.prepareCall("{call getCategoryById(?)}");
            callableStatement.setInt(1, categoryId);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                category.setId(resultSet.getInt("id"));
                category.setName(resultSet.getString("name"));
                category.setStatus(resultSet.getBoolean("status"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectionDB.closeConnection(connection);
        }
        return category;
    }

    @Override
    public boolean update(Category category, Integer entityId) {
        Connection connection = null;
        try {
            connection = ConnectionDB.openConnection();
            CallableStatement callableStatement = connection.prepareCall("{call updateCategoryById(?, ?, ?)}");
            callableStatement.setString(1, category.getName());
            callableStatement.setBoolean(2, category.isStatus());
            callableStatement.setInt(3, entityId);
            int check = callableStatement.executeUpdate();
            if (check > 0) {
                return true;
            }        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectionDB.closeConnection(connection);
        }
        return false;
    }

    @Override
    public boolean delete(Integer categoryId) {
        Connection connection = null;
        try {
            connection = ConnectionDB.openConnection();
            CallableStatement callableStatement = connection.prepareCall("{call deleteCategoryById(?)}");
            callableStatement.setInt(1, categoryId);
            int check = callableStatement.executeUpdate();
            if (check > 0) {
                return true;
            }        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            ConnectionDB.closeConnection(connection);
        }
        return false;
    }
}
