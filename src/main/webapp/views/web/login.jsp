<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-md-5 mx-auto">
            <div id="first">
                <div class="myform form ">
                    <div class="logo mb-3">
                        <div class="col-md-12 text-center">
                            <h1>Login</h1>
                        </div>
                    </div>
                    <form action="login" method="post" name="login">
                        <c:if test="${not empty message}">
                            <div class="alert alert-${alert} alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                <strong>Fail! </strong>${message}
                            </div>
                        </c:if>

                        <c:if test="${not empty sign_up_success}">
                            <div class="alert alert-success alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                <strong>${sign_up_success}</strong>
                            </div>
                        </c:if>

                        <div class="form-group">
                            <label for="exampleInputEmail1">Email address</label>
                            <input type="text" name="user"  class="form-control" id="email"  value="${login_user.email}" aria-describedby="emailHelp" placeholder="Enter Email">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Password</label>
                            <input type="password" name="pass" id="password"  value="${login_user.password}"class="form-control" aria-describedby="emailHelp" placeholder="Enter Password">
                        </div>
                        <div class="form-group">
                            <p class="text-center">By signing up you accept our <a href="#">Terms Of Use</a></p>
                        </div>
                        <div class="col-md-12 text-center ">
                            <button type="submit" class=" btn btn-block mybtn btn-primary tx-tfm">Login</button>
                        </div>
                        <div class="col-md-12 ">
                            <div class="login-or">
                                <hr class="hr-or">
                                <span class="span-or">or</span>
                            </div>
                        </div>
                        <div class="col-md-12 mb-3">
                            <p class="text-center">
                                <a href="javascript:void();" class="google btn mybtn"><i class="fa fa-google-plus">
                                </i> Signup using Google
                                </a>
                            </p>
                        </div>
                        <div class="form-group">
                            <p class="text-center">Don't have account? <a href="${pageContext.request.contextPath}/signup" id="signup">Sign up here</a></p>
                            <p class="text-center">Get back later?? <a href="${pageContext.request.contextPath}/home" id="home">Back to home</a></p>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>