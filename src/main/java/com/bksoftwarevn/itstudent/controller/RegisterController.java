package com.bksoftwarevn.itstudent.controller;

import com.bksoftwarevn.itstudent.model.Account;
import com.bksoftwarevn.itstudent.model.MyConnection;
import com.bksoftwarevn.itstudent.service.AccountService;
import com.bksoftwarevn.itstudent.service_impl.AccountServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

@WebServlet(name = "SignUpControl", urlPatterns = {"/signup"})
public class RegisterController extends HttpServlet {
    AccountService accountService = new AccountServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            Connection myConnection = (new MyConnection()).connectDB();
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("views/web/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String error = "";
        try {
            Connection myConnection = (new MyConnection()).connectDB();
            String firstName = request.getParameter("firstname");
            String lastName = request.getParameter("lastname");
            String email = request.getParameter("email");
            String password = request.getParameter("pass");
            String repass = request.getParameter("repass");
            Account account = new Account(email, password, firstName, lastName);
            request.setAttribute("login_user", account);

            if (firstName == "" || lastName == "" || email == "" || password == "" || repass == "") {
                System.out.println("có cái bị trống nè");
                error += "No fields are left blank! <br>";
            }
            if (accountService.checkAccountExist(email) != null) {
                error += "This email is already exist!";
            }
            System.out.println("errrr: " + error);
            if (error == "") {
                request.setAttribute("sign_up_success", "Sign-up success, Please login");
                System.out.println("Chuyển hướng về login, bạn đã đăng kí thành công");
                accountService.insert(account);
                request.getRequestDispatcher("views/web/login.jsp").forward(request, response);
            } else {
                System.out.println("Quay lại signup rồi in lỗi");
                request.setAttribute("err", error);
                request.getRequestDispatcher("views/web/register.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }


}
