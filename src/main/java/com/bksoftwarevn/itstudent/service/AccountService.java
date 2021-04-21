package com.bksoftwarevn.itstudent.service;

import com.bksoftwarevn.itstudent.model.Account;

import java.sql.SQLException;

public interface AccountService {
    Account getUserLogin(String name, String password) ;
    Account checkAccountExist(String email);
    public Account insert(Account account) throws SQLException;
}
