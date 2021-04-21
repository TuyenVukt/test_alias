package com.bksoftwarevn.itstudent.service_impl;

import com.bksoftwarevn.itstudent.dao.AccountDao;
import com.bksoftwarevn.itstudent.dao_impl.AccountDaoImpl;
import com.bksoftwarevn.itstudent.model.Account;
import com.bksoftwarevn.itstudent.service.AccountService;

import java.sql.SQLException;

public class AccountServiceImpl implements AccountService {
    private AccountDao accountDao = new AccountDaoImpl();
    @Override
    public Account getUserLogin(String name, String password) {
        return accountDao.getUserLogin(name, password);
    }

    @Override
    public Account checkAccountExist(String email) {
        return accountDao.checkAccountExist(email);
    }

    @Override
    public Account insert(Account account) throws SQLException {
        return accountDao.insert(account);
    }

}
