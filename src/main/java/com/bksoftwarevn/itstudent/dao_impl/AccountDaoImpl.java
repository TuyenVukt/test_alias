package com.bksoftwarevn.itstudent.dao_impl;

import com.bksoftwarevn.itstudent.dao.AccountDao;
import com.bksoftwarevn.itstudent.model.Account;
import com.bksoftwarevn.itstudent.model.MyConnection;
import com.bksoftwarevn.itstudent.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Scanner;

public class AccountDaoImpl implements AccountDao {
    private  MyConnection myConnection = new MyConnection();
    @Override
    public Account getObject(ResultSet resultSet) throws SQLException {
        Account account = null;
        // Sử dụng contructor full tham số (int id , String name,boolean deleleted)
        //resultSet.getInt("tên cột") để lấy ra giá trị của tên cột tương ứng ví dụ resultSet.getInt("id") để lấy ra
        //giá trị cột id
        account = new Account(resultSet.getInt("idUser"),
                resultSet.getString("email"),
                resultSet.getString("password"),
                resultSet.getBoolean("isSell"),
                resultSet.getBoolean("isAdmin"),
                resultSet.getString("firstName"),
                resultSet.getString("lastName"),
                resultSet.getString("phoneNumber"),
                resultSet.getBoolean("deleted"),
                resultSet.getString("address")
        );
        return account;
    }

    @Override
    public Account getUserLogin(String email, String password) {
        Account account = null;
        String sql = "SELECT * FROM account WHERE  email = ? AND password = ?";

        PreparedStatement preparedStatement = myConnection.prepare(sql);
        try{
            myConnection.connectDB();
            preparedStatement.setString(1,email);
            preparedStatement.setString(2,password);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.first()) {
                account = getObject(resultSet);
                System.out.println("Accout: ");
                account.toString();
            }

        }catch(Exception e){
            e.printStackTrace();
        }
        return account;

    }

    @Override
    public Account checkAccountExist(String email) {
        Account account = null;
        String sql = "SELECT * FROM account WHERE email = ? ;";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        try{
            preparedStatement.setString(1,email);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.first()) {
                account = getObject(resultSet);
                System.out.println("Account found:  ");
                account.toString();
            }else{
                System.out.println("Account not found!!");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return account;

    }

    public static void main(String[] args) {
//        MyConnection myConnection = new MyConnection();
//        Account account = new Account( 50,"Test123@gmail.com", "23456",false,false, "Nguyen", "Nga","", false, "");
//        AccountDaoImpl accountDao = new AccountDaoImpl();
//        try{
//            myConnection.connectDB();
//            Account newAccount = accountDao.insert(account);
//            if(newAccount!=null) System.out.println("Đã insert thành công!!"+ newAccount.getEmail());
//            else System.out.println("insert  thất bại");
//        }catch(Exception e){
//            e.printStackTrace();
//        }
        System.out.println("toi la tuyn \r\n dep trai");

    }


    @Override
    public List getList(ResultSet resultSet) throws SQLException {
        return null;
    }

    @Override
    public List findAll() throws SQLException {
        return null;
    }

    @Override
    public Account findById(int id) throws SQLException {
        Account account = null;
        String sql = "SELECT * FROM account as a" +
                " WHERE a.idUser = ?";
        PreparedStatement preparedStatement = myConnection.prepare(sql);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        if(resultSet.first()){
            account = getObject(resultSet);
        }
        return  account;

    }

    @Override
    public Account insert(Account account) throws SQLException {
        Account newAccount = null;
        String sql = "INSERT INTO account VALUES (null,?,?,?,?,?,?,?,false,null)";
        PreparedStatement preparedStatement = myConnection.prepareUpdate(sql);
        preparedStatement.setString(1, account.getEmail());
        preparedStatement.setString(2, account.getPassword());
        preparedStatement.setBoolean(3,false);
        preparedStatement.setBoolean(4,false);
        preparedStatement.setString(5,account.getFirstName());
        preparedStatement.setString(6,account.getLastName());
        preparedStatement.setString(7,account.getPhoneNumber());
        int rs = preparedStatement.executeUpdate();
        if(rs > 0 ) {
            ResultSet resultSet = preparedStatement.getGeneratedKeys();
            if(resultSet.first()) {
                newAccount = findById((int) resultSet.getLong(1));
            }
        }
        return newAccount;
    }
    @Override
    public boolean update(Account account) throws SQLException {
        return false;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        return false;
    }
}
