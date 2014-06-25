<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.hagenson.pizza.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div>
  <h3 style="text-align: center;">Customise ${size.getProduct().getName()}</h3>
  <form id="customiseFrm">
    <input type="hidden" name="id" value="${size.getId()}" />
    <div style="display:table; width:100%">
      <div style="display:table-row">
        <div class="cartHead" style="display:table-cell">
          Item
        </div>
        <div class="cartHead" style="display:table-cell">
          Price
        </div>        
        <div class="cartHead" style="display:table-cell">
          Selected
        </div>
      </div>

      <div style="display:table-row">
        <div class="cartCell" style="display:table-cell">
          Base pizza
        </div>
        <div class="cartCell" style="display:table-cell">
           <fmt:formatNumber value="${size.getPrice()}" type="currency" />
        </div>        
        <div class="cartCell" style="display:table-cell">
          <input type="checkbox" checked="checked" disabled="disabled"/>
        </div>
      </div>
      <c:forEach var="cust" items="${size.getProduct().getCustomisations()}">
      <div style="display:table-row">
        <div class="cartCell" style="display:table-cell">
          ${cust.getName()}
        </div>
        <div class="cartCell" style="display:table-cell">
           <fmt:formatNumber value="${cust.getPrice()}" type="currency" />
        </div>        
        <div class="cartCell" style="display:table-cell">
          <input type="checkbox" id="cust${cust.getId()}" name="cust${cust.getId()}" value="${cust.getPrice()}" onclick="javascript:custOptClick('cust${cust.getId()}');"/>
        </div>
      </div>
      </c:forEach>
      <div style="display:table-row">
        <div class="cartTotal" style="display:table-cell">
          Total
        </div>
        <div class="cartTotal" style="display:table-cell">
        </div>        
        <div class="cartTotal" style="display:table-cell">
          <input type="hidden" id="custTotal" value="${size.getPrice()}"/>
          $<a id="custTotalCost"><fmt:formatNumber value="${size.getPrice()}" maxFractionDigits="2" minFractionDigits="2" /></a>
        </div>
      </div>
    </div>
    <div style="text-align: right">
      <a class="button" href="javascript:dlgCancel()">Cancel</a>
      <a class="button" href="javascript:customisePost()">OK</a>
    </div>
  </form>
</div>