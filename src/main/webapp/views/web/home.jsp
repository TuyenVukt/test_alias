<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
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