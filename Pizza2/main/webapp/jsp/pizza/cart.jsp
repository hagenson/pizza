<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.hagenson.pizza.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="cart" style="display: table; width: 100%">
	<div style="display: table-row;">
		<div class="cartHead" style="display: table-cell;">Item</div>
		<div class="cartHead" style="display: table-cell;">Size</div>
		<div class="cartHead" style="display: table-cell;">No.</div>
		<div class="cartHead" style="display: table-cell;">Price</div>
		<div class="cartHead" style="display: table-cell;"></div>

	</div>

	<c:forEach var="line" items="${order.getLines()}">
		<div style="display: table-row;">
			<div class="cartCell" style="display: table-cell;">
				<c:out value="${line.getProduct().getName()}"/></div>
			<div class="cartCell" style="display: table-cell; text-align: right">
				<c:out value="${line.getSize().getName()}"/>
				  <c:forEach var="cust" items="${line.getCustomisations()}">
            <small>
				    <br/>
				    +<c:out value="${cust.getName()}"/>
				    </small>
				  </c:forEach>
				</div>
			<div class="cartCell" style="display: table-cell; text-align: right">
				<c:out value="${line.getCount()}"/></div>
			<div class="cartCell" style="display: table-cell; text-align: right">
				<fmt:formatNumber value="${line.getPrice()}" type="currency" />
			</div>
			<div class="cartCell" style="display: table-cell;">
				<a href="javascript:lineInc(${line.getId()})"><img alt="+"
					src="../img/lineInc.png" /></a> <a
					href="javascript:lineDec(${line.getId()})"><img alt="+"
					src="../img/lineDec.png" /></a>
			</div>
		</div>
	</c:forEach>

	<div style="display: table-row;">
		<div class="cartTotal" style="display: table-cell;">Total:</div>
		<div class="cartTotal" style="display: table-cell;"></div>
		<div class="cartTotal" style="display: table-cell;"></div>
		<div class="cartTotal" style="display: table-cell;">
			<fmt:formatNumber value="${order.getPrice()}" type="currency" />
		</div>
		<div class="cartTotal" style="display: table-cell;"></div>
	</div>
</div>
<div style="text-align: right;">
  <a class="button" href="javascript:placeOrder()">Buy</a>
  <a class="button" href="javascript:cancelOrder()">Cancel</a>  
</div>
