<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Detail Product</title>
    <link href="<c:url value='/web/css/detail.css' />" rel="stylesheet" type="text/css" media="all"/>
</head>

<body>
<div class="container">
    <div class="row">
        <%--                <jsp:include page="Left.jsp"></jsp:include>--%>
        <div class="col-sm-9">
            <div class="container">
                <div class="card">
                    <div class="row">
                        <aside class="col-sm-5 border-right">
                            <article class="gallery-wrap">
                                <div class="img-big-wrap">
                                    <div><a href="#"><img src="${detail.image}"></a></div>
                                </div> <!-- slider-product.// -->
                                <div class="img-small-wrap">
                                </div> <!-- slider-nav.// -->
                            </article> <!-- gallery-wrap .end// -->
                        </aside>
                        <aside class="col-sm-7">
                            <article class="card-body p-5">
                                <h3 class="title mb-3">${detail.name}</h3>

                                <p class="price-detail-wrap">
                                            <span class="price h3 text-warning">
                                                <fmt:setLocale value="vi_VN"/>
                                            <fmt:formatNumber value="${detail.price}" type="currency"/>
                                            </span>
                                </p>

                                </p> <!-- price-detail-wrap .// -->
                                <dl class="item-property">
                                    <dt>Description</dt>
                                    <dd><p>
                                        ${detail.introduction}
                                    </p></dd>
                                </dl>

                                <hr>
                                <div class="row">
                                    <div class="col-sm-5">
                                        <dl class="param param-inline">
                                            <dt>Quantity:</dt>
                                            <dd>
                                                <div class="buttons_added">
                                                    <input class="minus is-form" type="button" value="-">
                                                    <input aria-label="quantity" class="input-qty" max="10" min="1"
                                                           name="" type="number" value="1"> <input class="plus is-form"
                                                                                                   type="button"
                                                                                                   value="+">
                                                </div>
                                            </dd>
                                        </dl>  <!-- item-property .// -->
                                    </div> <!-- col.// -->

                                </div> <!-- row.// -->
                                <hr>
                                <a href="#" class="btn btn-lg btn-primary text-uppercase"> Buy now </a>
                                <a href="#" class="btn btn-lg btn-outline-primary text-uppercase"> <i
                                        class="fas fa-shopping-cart"></i> Add to cart </a>
                            </article> <!-- card-body.// -->
                        </aside> <!-- col.// -->
                    </div> <!-- row.// -->
                </div> <!-- card.// -->


            </div>
        </div>
    </div>
</div>
<script>
    $('input.input-qty').each(function () {
        var $this = $(this),
            qty = $this.parent().find('.is-form'),
            min = Number($this.attr('min')),
            max = Number($this.attr('max'))
        if (min == 0) {
            var d = 0
        } else d = min
        $(qty).on('click', function () {
            if ($(this).hasClass('minus')) {
                if (d > min) d += -1
            } else if ($(this).hasClass('plus')) {
                var x = Number($this.val()) + 1
                if (x <= max) d += 1
            }
            $this.attr('value', d).val(d)
        })
    })
    //]]>
</script>
</body>

</html>
