<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!------ Include the above in your HEAD tag ---------->
    <%--    <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>--%>
    <link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
    <link rel="stylesheet" href="web/css/login.css">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <title>Document</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-5 mx-auto">
            <div id="second">
                <div class="myform form ">
                    <div class="logo mb-3">
                        <div class="col-md-12 text-center">
                            <h1 >Signup</h1>
                        </div>
                    </div>
                    <form action="signup" name="signup" method="post">
                        <c:if test="${not empty err}">
                            <div class="alert alert-danger alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                <strong>Fail!</strong>${err}
                            </div>
                        </c:if>
                        <div class="form-group">
                            <label for="exampleInputEmail1">First Name</label>
                            <input type="text"  name="firstname" class="form-control" id="firstname" aria-describedby="emailHelp" value="${login_user.firstName}" placeholder="Enter Firstname">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Last Name</label>
                            <input type="text"  name="lastname" class="form-control" id="lastname" aria-describedby="emailHelp" value="${login_user.lastName}" placeholder="Enter Lastname">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Email address</label>
                            <input type="email" name="email"  class="form-control" id="email-register" aria-describedby="emailHelp" value="${login_user.email}" placeholder="Enter email">
                            <p class="alert-danger d-none " id="emailfail">This email invalid!!</p>
                            <p class="alert-success d-none" id="emailok">This email is ok!!</p>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Password</label>
                            <input type="password" name="pass" id="password-register"  class="form-control" aria-describedby="emailHelp" placeholder="Enter Password">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Password</label>
                            <input type="password" name="repass" id="repassword"  class="form-control" aria-describedby="emailHelp" placeholder="Repeat Password">
                            <p class="alert-danger d-none " id="repass-fail">Passwords does not match!</p>
                        </div>
                        <div class="col-md-12 text-center mb-3">
                            <button type="submit" class=" btn btn-block mybtn btn-primary tx-tfm">Get Started For Free</button>
                        </div>
                        <div class="col-md-12 ">
                            <div class="form-group">
                                <p class="text-center"><a href="${pageContext.request.contextPath}/login" id="signin">Already have an account?</a></p>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $("#email-register").on('keyup', function(){
        var valid = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/.test(this.value);
        if(valid){
            $("#emailok").removeClass("d-none");
            $("#emailfail").addClass("d-none");
        }else{
            $("#emailfail").removeClass("d-none");
            $("#emailok").addClass("d-none");
        }
    });

    $("#repassword").on('keyup', function(){
        var password = $("#password-register").val();
        var confirmPassword = $("#repassword").val();
        console.log(password, confirmPassword );
        if (password != confirmPassword){
            $("#repass-fail").removeClass("d-none");
        }else  {$("#repass-fail").addClass("d-none");};
    });

</script>
</body>
</html>