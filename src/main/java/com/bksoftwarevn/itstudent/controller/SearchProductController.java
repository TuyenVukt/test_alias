package com.bksoftwarevn.itstudent.controller;

import com.bksoftwarevn.itstudent.model.Category;
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
import java.util.List;

@WebServlet(name = "SearchControl", urlPatterns = {"/search"})
public class SearchProductController extends HttpServlet {
    private ProductService productService = new ProductService_Impl();
    private CategoryService categoryService = new CategoryServiceImpl();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String productSearch = request.getParameter("name");
        try{
            List<Product> list = productService.findByName(productSearch);
            List<Category> listC = categoryService.findAll();
            request.setAttribute("listP", list);
            request.setAttribute("listCC", listC);
            if(list==null){
                request.setAttribute("emptyP","Didn't find any product with this name!!" );
            }
            request.getRequestDispatcher("views/web/home.jsp").forward(request, response);
        }catch (Exception e){
            request.getRequestDispatcher("views/web/notfound.jsp").forward(request, response);
            e.printStackTrace();
        }

    }
}
