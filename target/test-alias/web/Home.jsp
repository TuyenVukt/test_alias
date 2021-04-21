<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
<%--    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">--%>
<%--    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>--%>
<%--    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>
<%--    <!------ Include the above in your HEAD tag ---------->--%>
<%--    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"--%>
<%--          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">--%>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.1.1/js/all.js" integrity="sha384-BtvRZcyfv4r0x/phJt9Y9HhnN5ur1Z+kZbKVgzVBAlQZX4jvAuImlIz+bG7TS00a" crossorigin="anonymous"></script>
<%--    <link href="css/style.css" rel="stylesheet" type="text/css"/>--%>
    <link rel="stylesheet" href="web/css/style.css">
    <link rel="stylesheet" href="web/css/home-style.css">
    <link rel="stylesheet" href="web/css/home-header.css">
    <script src = "web/js/main.js"></script>
</head>
<body>
<jsp:include page="Menu.jsp"></jsp:include>
<div class="container">
    <div class="row">
        <div class="col">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="Home.jsp">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Category</a></li>
                    <li class="breadcrumb-item active" aria-current="#">Sub-category</li>
                </ol>
            </nav>
        </div>
    </div>
</div>
<%--<div class="container">--%>
<%--    <div class="row">--%>
<%--        &lt;%&ndash;                <jsp:include page="Left.jsp"></jsp:include>&ndash;%&gt;--%>

<%--        <div class="col-sm-9">--%>
<%--            <div id="content" class="row">--%>
<%--                <c:forEach items="${listP}" var="o">--%>
<%--                    <div class="product col-12 col-md-6 col-lg-4">--%>
<%--                        <div class="card">--%>
<%--                            <img class="card-img-top" src="${o.image}" alt="Card image cap">--%>
<%--                            <div class="card-body">--%>
<%--                                <h4 class="card-title show_txt"><a href="detail?pid=${o.id}"--%>
<%--                                                                   title="View Product">${o.name}</a></h4>--%>
<%--                                <p class="card-text show_txt">${o.introduction}</p>--%>
<%--                                <div class="row">--%>
<%--                                    <div class="col">--%>
<%--                                        <p class="btn btn-danger btn-block">${o.price} $</p>--%>
<%--                                    </div>--%>
<%--                                    <div class="col">--%>
<%--                                        <a href="#" class="btn btn-success btn-block">Add to cart</a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </c:forEach>--%>
<%--            </div>--%>
<%--            <button onclick="loadMore()" class="btn btn-primary">Load more</button>--%>
<%--        </div>--%>

<%--    </div>--%>
<%--</div>--%>
<div class="container ">
    <div class="row ">
        <div class="col-sm-3 ">
            <div class="card bg-light mb-3 ">
                <div class="card-header bg-primary text-white text-uppercase "><i class="fa fa-list "></i> Categories
                </div>
                <ul class="list-group category_block ">
                    <c:forEach items="${listCC}" var="c">
                        <li class="list-group-item text-white ${tag == c.id ? 'active':''}"><a href="category?cid=${c.id}">${c.name}</a></li>
                    </c:forEach>
                </ul>
            </div>
            <div class="card bg-light mb-3 ">
                <div class="card-header bg-success text-white text-uppercase ">Last product</div>
                <div class="card-body ">
                    <img class="img-fluid "
                         src="https://www.zdnet.com/a/hub/i/r/2020/11/16/37e33024-2892-4bb7-9d21-6ac6f7544def/thumbnail/770x433/5f1b7f881bfb80a9f2bbe02bc6d64b49/apple-macbook-pro-m1-2020-5.jpg "/>
                    <h5 class="card-title ">Name</h5>
                    <p class="card-text ">Title</p>
                    <p class="bloc_left_price ">25000000</p>
                </div>
            </div>

        </div>

        <div class="col-sm-9 ">
            <div class="row" id="all-product">
                <c:if test="${not empty emptyP}">
                    <h1>${emptyP}</h1>
                </c:if>
                <c:forEach items="${listP}" var="o">
                    <div class="col-12 col-md-6 col-lg-4 product-block">
                        <a href="detail?pid=${o.id}">
                            <div class="product-img">
                                <img class="card-img-top "
                                     src="${o.image}"
                                     alt="Card image cap ">
                            </div>
                            <div class="product-body ">

                                <p class="product-name">${o.name}</p>
                                <p class="product-price">
                                    <fmt:setLocale value = "vi_VN"/>
                                    <fmt:formatNumber value = "${o.price}"
                                                                           type = "currency"/></p>
                                <p class="product-title">${o.introduction}</p>

                                <a href="# ">
                                    <div class="cart-block">
                                        <div class="cart-icon">
                                            <i class="fa fa-cart-plus" aria-hidden="true"></i>
                                        </div>

                                        <div class="cart-text">Giỏ hàng</div>

                                    </div>

                                </a>

                            </div>
                        </a>


                    </div>
                </c:forEach>

            </div>
        </div>

    </div>
</div>

<jsp:include page="Footer.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
                        function loadMore() {
                            var amount = document.getElementsByClassName("product").length;
                            $.ajax({
                                url: "/Project_banhang/load",
                                type: "get", //send it through get method
                                data: {
                                    exits: amount
                                },
                                success: function (data) {
                                    var row = document.getElementById("content");
                                    row.innerHTML += data;
                                },
                                error: function (xhr) {
                                    //Do Something to handle error
                                }
                            });
                        }
                        function searchByName(param){
                            var txtSearch = param.value;
                            $.ajax({
                                url: "/Project_banhang/searchAjax",
                                type: "get", //send it through get method
                                data: {
                                    txt: txtSearch
                                },
                                success: function (data) {
                                    var row = document.getElementById("content");
                                    row.innerHTML = data;
                                },
                                error: function (xhr) {
                                    //Do Something to handle error
                                }
                            });
                        }
                        function viewMoney(price){
                            if(price!=null){
                                return price.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.");
                            } else return "";
                        }
        </script>
</body>
</html>

