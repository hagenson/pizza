<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.hagenson.pizza.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="cardDetails">
	<form id="cardDetailsFrm">
		<div style="display:table;">
			<div style="display:table-row;">
				<div style="display:table-cell">
					Credit card number:
				</div>
				<div style="display:table-cell; width:10px">
				</div>
				<div style="display:table-cell">
					<input type="text" id="cardNumber" name="cardNumber" />
				</div>		
			</div>
			<div style="display:table-row;">
				<div style="display:table-cell">
					Expiry date:
				</div>
				<div style="display:table-cell; width:10px">
				</div>
				<div style="display:table-cell">
					<input type="text" id="expiryDate" name="expiryDate" />
				</div>		
			</div>
			<div style="display:table-row;">
				<div style="display:table-cell">
					CVC:
				</div>
				<div style="display:table-cell; width:10px">
				</div>
				<div style="display:table-cell">
					<input type="text" id="cvc" name="cvc" />
				</div>		
			</div>
		</div>
		<div style="text-align: right">
			<a class="button" href="javascript:dlgCancel()">Cancel</a>
			<a class="button" href="javascript:processOrder()">Buy</a>
		</div>
		
	</form>
</div>
