package com.bksoftwarevn.itstudent.controller.admin;

import com.bksoftwarevn.itstudent.model.Product;
import com.bksoftwarevn.itstudent.service.CategoryService;
import com.bksoftwarevn.itstudent.service.ProductService;
import com.bksoftwarevn.itstudent.service_impl.CategoryServiceImpl;
import com.bksoftwarevn.itstudent.service_impl.ProductService_Impl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/admin-product-list"})
public class NewController extends HttpServlet {
    private ProductService productService = new ProductService_Impl();
    private CategoryService categoryService = new CategoryServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/views/admin/list.jsp");
        rd.forward(request, response);
    }
}
