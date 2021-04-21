package com.bksoftwarevn.itstudent.dao;

import com.bksoftwarevn.itstudent.model.Account;

public interface AccountDao extends BaseDao<Account>{
    Account getUserLogin(String email, String password);
    Account checkAccountExist(String email);
    
}
