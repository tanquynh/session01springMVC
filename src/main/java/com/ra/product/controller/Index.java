package com.ra.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class Index {
    @RequestMapping("")
    public String index() {
        return "index";
    }
}
