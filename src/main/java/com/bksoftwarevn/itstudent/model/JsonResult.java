package com.bksoftwarevn.itstudent.model;

import com.google.gson.Gson;

public class JsonResult {// đóng gói dữ liệu lấy được từ db sang dạng chuỗi json đề front-end dễ dàng xử lí

    private String message;

    private Object data;

    public JsonResult() {
    }

    public JsonResult(String message, Object data) {
        this.message = message;
        this.data = data;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "JsonResult{" +
                "message='" + message + '\'' +
                ", data=" + data +
                '}';
    }

    public String jsonSuccess(Object data) {
        return new Gson().toJson(new JsonResult("success",data));
    }
    //Nếu lấy dữ liệu thành công thì message = success

    public String jsonFail(Object data) {
        return new Gson().toJson(new JsonResult("fail",data));
    }
    //ngược lại thì message = fail
}
