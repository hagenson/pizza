<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.hagenson.pizza.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div>
	<a class="button" href="javascript:newCustomer()">Enter delivery details</a>
	<a class="button" href="javascript:existingCustomer()">I have an account</a>		
</div>
<div id="custDetails">
	<form id="custDetailsFrm">
		<div style="display:table;">
			<div style="display:table-row;">
				<div style="display:table-cell">
					First name:
				</div>
				<div style="display:table-cell; width:10px">
				</div>
				<div style="display:table-cell">
					<input type="text" id="firstName" name="firstName" />
				</div>		
			</div>
			<div style="display:table-row;">
				<div style="display:table-cell">
					Last name:
				</div>
				<div style="display:table-cell; width:10px">
				</div>
				<div style="display:table-cell">
					<input type="text" id="lastName" name="lastName" />
				</div>		
			</div>
			<div style="display:table-row;">
				<div style="display:table-cell">
					House &amp; Street:
				</div>
				<div style="display:table-cell; width:10px">
				</div>
				<div style="display:table-cell">
					<input type="text" id="addressLine1" name="addressLine1" />
				</div>		
			</div>
			<div style="display:table-row;">
				<div style="display:table-cell">
					Suburb:
				</div>
				<div style="display:table-cell; width:10px">
				</div>
				<div style="display:table-cell">
					<input type="text" id="addressLine2" name="addressLine2" />
				</div>		
			</div>
			<div style="display:table-row;">
				<div style="display:table-cell">
					Town/City:
				</div>
				<div style="display:table-cell; width:10px">
				</div>
				<div style="display:table-cell">
					<input type="text" id="addressLine3" name="addressLine3" />
				</div>		
			</div>
			<div style="display:table-row;">
				<div style="display:table-cell">
					Post code:
				</div>
				<div style="display:table-cell; width:10px">
				</div>
				<div style="display:table-cell">
					<input type="text" id="addressLine4" name="addressLine4" />
				</div>		
			</div>
			<div style="display:table-row;">
				<div style="display:table-cell">
					Contact phone number:
				</div>
				<div style="display:table-cell; width:10px">
				</div>
				<div style="display:table-cell">
					<input type="text" id="phoneNumber" name="phoneNumber" />
				</div>		
			</div>
			<div style="display:table-row;">
				<div style="display:table-cell">
					Email address:
				</div>
				<div style="display:table-cell; width:10px">
				</div>
				<div style="display:table-cell">
					<input type="text" id="email" name="email" />
				</div>		
			</div>
			<div style="display:table-row;">
				<div style="display:table-cell">
					Password:
				</div>
				<div style="display:table-cell; width:10px">
				</div>
				<div style="display:table-cell">
					<input type="password" id="password" name="password" />
				</div>		
			</div>
			<div style="display:table-row;">
				<div style="display:table-cell">
					Confirm password:
				</div>
				<div style="display:table-cell; width:10px">
				</div>
				<div style="display:table-cell">
					<input type="password" id="passwordConfirm"/>
				</div>		
			</div>
		</div>
		<div style="text-align: right">
			<a class="button" href="javascript:dlgCancel()">Cancel</a>
			<a class="button" href="javascript:custCreate()">Next</a>
		</div>		
	</form>
</div>
<div id="custLogin" style="display:none">
	<form id="custLoginFrm">
		<div style="display:table;">
			<div style="display:table-row;">
				<div style="display:table-cell">
					Email address:
				</div>
				<div style="display:table-cell; width:10px">
				</div>
				<div style="display:table-cell">
					<input type="text" id="email" name="email" />
				</div>		
			</div>
			<div style="display:table-row;">
				<div style="display:table-cell">
					Password:
				</div>
				<div style="display:table-cell; width:10px">
				</div>
				<div style="display:table-cell">
					<input type="password" id="password" name="password" />
				</div>		
			</div>
		</div>
		<div style="text-align: right">
			<a class="button" href="javascript:dlgCancel()">Cancel</a>
			<a class="button" href="javascript:custLogin()">Next</a>
		</div>
	</form>
</div>