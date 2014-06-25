<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.hagenson.pizza.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div>
	<h1>Thank you!</h1>
	<p>
		Your order has been processed and will soon be winging it's way to you in our
		special Praego Pizza-mobile.
	</p>
	<p>
		We hope you enjoy your food and if there are any problems, please phone us on<br>
		0800 123 4567<br/>
		and quote order number:<br/>
		${order.getId()}
	</p>
	
</div>
<div style="text-align:center;">
	<a class="button" href="javascript:buyComplete()">Close</a>
</div>
