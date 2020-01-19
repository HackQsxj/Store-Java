﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>会员登录</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
		<!-- 引入自定义css文件 style.css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css"/>

		<style>
			body {
				margin-top: 20px;
				margin: 0 auto;
			}
			
			.carousel-inner .item img {
				width: 100%;
				height: 300px;
			}
		</style>
	</head>

	<body>

			<%@include file="/jsp/header.jsp"%>
		<div class="container">
			<div class="row">

				<div style="margin:0 auto; margin-top:10px;width:950px;">
					<strong>我的订单</strong>
					<table class="table table-bordered">
						
						<c:forEach items="${pageBean.list }" var="order">
							<tbody>
							<tr class="success">
								<th colspan="5">
									订单编号:${order.oid } 
									总金额:￥${order.total }
									<c:if test="${order.state==1 }">
										<a href="${pageContext.request.contextPath}/OrderServlet?method=findOrderByOid&oid=${order.oid }" >付款</a>
									</c:if>
									<c:if test="${order.state==2 }">未发货</c:if>
									<c:if test="${order.state==3 }">
										<a href="#" >签收</a>
									</c:if>
									<c:if test="${order.state==4 }">收获成功</c:if>
								</th>
							</tr>
							<tr class="warning">
								<th>图片</th>
								<th>商品</th>
								<th>价格</th>
								<th>数量</th>
								<th>小计</th>
							</tr>
							<c:forEach items="${order.list }" var="item">
								<tr class="active">
								<td width="60" width="40%">
									<input type="hidden" name="id" value="22">
									<img src="${pageContext.request.contextPath}/${item.product.pimage}" width="70" height="60">
								</td>
								<td width="30%">
									<a target="_blank"> ${item.product.pname }</a>
								</td>
								<td width="20%">
									￥${item.product.shop_price }
								</td>
								<td width="10%">
									${item.quantity }
								</td>
								<td width="15%">
									<span class="subtotal">￥${item.total }</span>
								</td>
							</tr>
							</c:forEach>
							
						</tbody>
						</c:forEach>
						
					</table>
				</div>
			</div>
			<!--分页 -->
		<div style="width:380px;margin:0 auto;margin-top:50px;">
			<ul class="pagination" style="text-align:center; margin-top:10px;">
				<li class="disabled">
					<a href="${pageContext.request.contextPath}/${pageBean.path }&pageNumber=${pageBean.prePageNum}" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
				
				<c:forEach begin="${pageBean.startPage}" end="${pageBean.endPage}" var="pagenum">
    		   			<li ><a href="${pageContext.request.contextPath}/${pageBean.path }&pageNumber=${pagenum}">${pagenum}</a></li>

    			</c:forEach>
				
				<li class="disabled">
					<a href="${pageContext.request.contextPath}/${pageBean.path }&pageNumber=${pageBean.nextPageNum}" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</ul>
		</div>
		<!-- 分页结束=======================        -->
		</div>

		<%@include file="/jsp/footer.jsp"%>
	</body>

</html>