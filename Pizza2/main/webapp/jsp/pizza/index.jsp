<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.hagenson.pizza.*"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<t:layoutMain>
	<jsp:attribute name="title">Welcome to Praego Pizza</jsp:attribute>

	<jsp:attribute name="header">
      <h1>Praego Pizza Online Order</h1>
  </jsp:attribute>

	<jsp:attribute name="footer">
  </jsp:attribute>

  <jsp:attribute name="rightBar">
    <form id="cartForm">
      <h3 style="text-align: center;">Your order</h3>
      <div id="cartContent">
        <c:import url="/pizza/cart.html" />
      </div>
    </form>
  </jsp:attribute>
  
	<jsp:body>
    <p>At Preago, we love pizza as much as you do.</p>
    <p>Choose your favourite from one of our house specials, or customise to your own exacting specification.</p>
		<div style="display: table">
      <div style="display: table-row">
        <div style="display: table-cell;"></div>
		    <div class="catRowSpacer" style="display: table-cell;"></div>
		    <div style="display: table-cell;"></div>
      </div>
     
			<c:forEach var="prod" items="${products}">
				<div class="catRow" style="display: table-row;">
					<div class="catImage" style="display: table-cell">
						<img alt="${prod.getName()}"
							src="../img/${prod.getCategory()}Cat.png" />
					</div>
					<div class="catText" style="display: table-cell">
						<div class="catTitle">
							${prod.getName()}
						</div>
						<div class="catDescription">
							${prod.getDescription()}
						</div>							
					</div>
					<div class="catSizes" style="display: table-cell">
						<div style="display: table">							
						<c:forEach var="size" items="${prod.getSizes()}">
							<div style="display: table-row">
								<div class="catSizeText" style="display: table-cell">
									${size.getName()}
								</div>
								<div class="catSizeText" style="display: table-cell">
									<fmt:formatNumber value="${size.getPrice()}" type="currency" />
								</div>
								<div class="catSizeBtn" style="display: table-cell">
									<a href="javascript:addToCart(${size.getId()})"><img
											alt="Add to cart" src="../img/addToCart.png" /></a>
									<a href="javascript:customiseDialog(${size.getId()})"><img
											alt="Customise" src="../img/custom.png" /></a>
								</div>
							</div>
						</c:forEach>
						</div>
					</div>											
				</div>
				<div style="display: table-row">
					<div style="display: table-cell;"></div>
					<div class="catRowSpacer" style="display: table-cell;"></div>
					<div style="display: table-cell;"></div>
				</div>					
			</c:forEach>     	
     </div>
     
     
     <div id="dlg" style="display: hidden">
       <div id="dlgContent">
       </div>
     </div> 
   </jsp:body>

</t:layoutMain>

