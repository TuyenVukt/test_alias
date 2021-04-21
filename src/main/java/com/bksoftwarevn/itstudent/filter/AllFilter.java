package com.bksoftwarevn.itstudent.filter;

import com.bksoftwarevn.itstudent.model.MyConnection;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//@WebFilter(filterName = "AllFilter", urlPatterns = "/*")
public class AllFilter implements Filter {

    private MyConnection myConnection = new MyConnection();
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        servletRequest.setCharacterEncoding("UTF-8");

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        try {
            myConnection.connectDB();
            System.out.println("filter Database!!");
        } catch (Exception e) {
            System.out.println("Cannot connect to database !!!");
            servletRequest.getRequestDispatcher("views/web/notfound.jsp").forward(request, response);
            e.printStackTrace();
        }
        filterChain.doFilter(request,response);
    }

    @Override
    public void destroy() {

    }
}
