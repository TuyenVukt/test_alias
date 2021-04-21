package com.bksoftwarevn.itstudent.controller;

import com.bksoftwarevn.itstudent.model.Account;
import com.bksoftwarevn.itstudent.model.MyConnection;
import com.bksoftwarevn.itstudent.service.AccountService;
import com.bksoftwarevn.itstudent.service_impl.AccountServiceImpl;
import com.bksoftwarevn.itstudent.utils.SessionUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.ResourceBundle;

@WebServlet(name = "LoginControl", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {
    AccountService accountService = new AccountServiceImpl();
    ResourceBundle resourceBundle = ResourceBundle.getBundle("message");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String alert = request.getParameter("alert");
        String message = request.getParameter("message");
        if (message != null && alert != null) {
            request.setAttribute("message", resourceBundle.getString(message));
            request.setAttribute("alert", alert);
        }
        request.getRequestDispatcher("views/web/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        Account a = accountService.getUserLogin(username, password);
        if (a == null) {

            response.sendRedirect(request.getContextPath()+"/login?message=username_password_invalid&alert=danger");
        } else {
            SessionUtil.getInstance().putValue(request, "acc", a);
            if (a.isAdmin()) {
                response.sendRedirect(request.getContextPath() + "/admin-home");
            } else {
                response.sendRedirect(request.getContextPath() + "/home");
            }

        }
    }

}
