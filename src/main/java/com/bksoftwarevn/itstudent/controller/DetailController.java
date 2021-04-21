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

@WebServlet(name = "DetailControl", urlPatterns = {"/detail"})// xử lí trang detail
public class DetailController extends HttpServlet {
    private ProductService productService = new ProductService_Impl();
    private CategoryService categoryService = new CategoryServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        int id = Integer.parseInt(request.getParameter("pid"));
        try{
            Connection myConnection = (new MyConnection()).connectDB();
            Product product = productService.findById(id);
            List<Category> listC = categoryService.findAll();
            product.toString();
            request.setAttribute("detail", product);
            request.setAttribute("listCC", listC);
            request.getRequestDispatcher("views/web/detail_product.jsp").forward(request, response);
        }catch (Exception e){
            request.getRequestDispatcher("views/web/notfound.jsp").forward(request, response);
            e.printStackTrace();
        }
    }


}
