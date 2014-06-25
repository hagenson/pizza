<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.hagenson.pizza.*"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<t:layoutMain>
	<jsp:attribute name="title">Praego Pizza Order Management</jsp:attribute>

	<jsp:attribute name="header">
      <h1>Praego Pizza Order Management</h1>
  </jsp:attribute>

	<jsp:attribute name="footer">
  </jsp:attribute>

  <jsp:attribute name="rightBar">
    <form id="cartForm">
      <h3 style="text-align: center;">Troubled orders</h3>
      <div id="cartContent">
        <c:import url="/order/troubled.html" />
      </div>
    </form>
  </jsp:attribute>
  
	<jsp:body>
	 <h2>Processing</h2>
		<div style="display: table; width:100%">
      <div style="display: table-row">
        <div class="cartHead" style="display: table-cell;">Order Number</div>
        <div class="cartHead" style="display: table-cell;">Date</div>
        <div class="cartHead" style="display: table-cell;">Details</div>
        <div class="cartHead" style="display: table-cell;"></div>
      </div>
     
			<c:forEach var="order" items="${process}">
			<div style="display: table-row;">
        <div class="cartCell" style="display: table-cell;">
          ${order.getId()}
        </div>
        <div class="cartCell" style="display: table-cell;">
          ${order.getDate()}

        </div>
        <div class="cartCell" style="display: table-cell;">
          <div style="display:table; width:100%">
            <c:forEach var="line" items="${order.getLines()}">
            <div style="display:table-row">
              <div style="display:table-cell">
                Product:
              </div>            
              <div style="display:table-cell">
                <c:out value="${line.getProduct().getName()}" />
              </div>
            </div>
            <div style="display:table-row">
              <div style="display:table-cell">
                Size:
              </div>            
              <div style="display:table-cell">
                <c:out value="${line.getSize().getName()}" />
              </div>
            </div>
            <div style="display:table-row">
              <div style="display:table-cell">
                Options:
              </div>            
              <div style="display:table-cell">
                <c:forEach var="cust" items="${line.getCustomisations()}">
                  <c:out value="${cust.getName()}" />
                  </br>
                </c:forEach>
              </div>
            </div>
            <div style="display:table-row">
              <div style="display:table-cell">
                Number:
              </div>            
              <div style="display:table-cell">
                <c:out value="${line.getCount()}" />
              </div>
            </div>
            
            </c:forEach>
            
          </div>
        </div>
			</div>
  		</c:forEach>
  	</div>
     
   </jsp:body>
   
</t:layoutMain>

