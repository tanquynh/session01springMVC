package com.ra.product.controller;

import com.ra.product.model.dao.CategoryDAO;
import com.ra.product.model.dao.ProductDAO;
import com.ra.product.model.entity.Category;
import com.ra.product.model.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ProductDAO productDAO;
    @Autowired
    private CategoryDAO categoryDAO;

    @RequestMapping("")
    public String index(Model model) {
        List<Product> productList = productDAO.getAll();
        model.addAttribute("productList", productList);
        List<Category> categoryList = categoryDAO.getAll();
        model.addAttribute("categoryList", categoryList);
        return "product/index";
    }

    @RequestMapping("/add")
    public String add(Model model) {
        Product product = new Product();
        model.addAttribute("product", product);
        List<Category> categoryList = categoryDAO.getAll();
        model.addAttribute("categoryList", categoryList);
        return "product/add";
    }

    @RequestMapping("/add-product")
    public String addProduct(@ModelAttribute Product product, @RequestParam("img_upload")MultipartFile file, HttpServletRequest request) {
        String path = request.getServletContext().getRealPath("uploads/images");
        String fileName = file.getOriginalFilename();
        File destination = new File(path + "/" + fileName);
        try {
            file.transferTo(destination);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        product.setImage(fileName);
        productDAO.save(product);
        return "redirect:/product";
    }

    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable("id") int id, Model model) {
        Product product = productDAO.getById(id);
        model.addAttribute("product", product);
        List<Category> categoryList = categoryDAO.getAll();
        model.addAttribute("categoryList", categoryList);
        return "product/edit";
    }

    @RequestMapping("/edit-product")
    public String editProduct(@ModelAttribute Product product) {
        productDAO.update(product, product.getId());
        return "redirect:/product";
    }
    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable("id") int id) {
        productDAO.delete(id);
        return "redirect:/product";
    }
}
