package com.bksoftwarevn.itstudent.controller;

import com.bksoftwarevn.itstudent.model.Category;
import com.bksoftwarevn.itstudent.model.MyConnection;
import com.bksoftwarevn.itstudent.model.Product;
import com.bksoftwarevn.itstudent.service.CategoryService;
import com.bksoftwarevn.itstudent.service.ProductService;
import com.bksoftwarevn.itstudent.service_impl.CategoryServiceImpl;
import com.bksoftwarevn.itstudent.service_impl.ProductService_Impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class Test {
    public static void main(String[] args) throws SQLException, ClassNotFoundException, Exception{

        Connection myConnection = (new MyConnection()).connectDB();
        List<Product> p = new ProductService_Impl().findAll();


    }
}
