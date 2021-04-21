package com.bksoftwarevn.itstudent.filter;

import com.bksoftwarevn.itstudent.model.Account;
import com.bksoftwarevn.itstudent.model.MyConnection;
import com.bksoftwarevn.itstudent.utils.SessionUtil;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "AuthorizationFilter", urlPatterns = "/*")
public class AuthorizationFilter implements Filter {

    private ServletContext context;
    private MyConnection myConnection = new MyConnection();

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.context = filterConfig.getServletContext();
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

        String url = request.getRequestURI();


        if (url.contains("/admin")) {
            System.out.println(">> filter admin!!");
            Account account = (Account) SessionUtil.getInstance().getValue(request, "acc");
            if (account != null) {
                if (account.isAdmin()) {
                    System.out.println("This is admin!!" + account.toString());
                    filterChain.doFilter(servletRequest, servletResponse);
                } else {
                    response.sendRedirect(request.getContextPath() + "/login?message=not_permission&alert=danger");
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/login?message=not_login&alert=danger");
            }
        } else {
            filterChain.doFilter(servletRequest, servletResponse);
        }


    }

    @Override
    public void destroy() {

    }
//
}
