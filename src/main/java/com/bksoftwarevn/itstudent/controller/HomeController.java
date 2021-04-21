/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bksoftwarevn.itstudent.controller;

import com.bksoftwarevn.itstudent.model.Category;
import com.bksoftwarevn.itstudent.model.MyConnection;
import com.bksoftwarevn.itstudent.model.Product;
import com.bksoftwarevn.itstudent.service.CategoryService;
import com.bksoftwarevn.itstudent.service.ProductService;
import com.bksoftwarevn.itstudent.service_impl.CategoryServiceImpl;
import com.bksoftwarevn.itstudent.service_impl.ProductService_Impl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet(name = "HomeControl", urlPatterns = {"/home"})//home cái này là trang chủ
public class HomeController extends HttpServlet {

    private ProductService productService = new ProductService_Impl();
    private CategoryService categoryService = new CategoryServiceImpl();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        try{
            List<Product> list = productService.findAll();
            List<Category> listC = categoryService.findAll();
            req.setAttribute("listP", list);
            req.setAttribute("listCC", listC);
            req.getRequestDispatcher("views/web/home.jsp").forward(req, resp);
        }catch (Exception e){
            req.getRequestDispatcher("views/web/notfound.jsp").forward(req, resp);
            e.printStackTrace();
        }

    }
}
