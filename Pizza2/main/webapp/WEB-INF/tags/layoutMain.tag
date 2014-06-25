<%@tag import="java.awt.print.Pageable"%>
<%@tag description="Main page template" pageEncoding="UTF-8"%>
<%@attribute name="header" fragment="true"%>
<%@attribute name="headContent" fragment="true"%>
<%@attribute name="footer" fragment="true"%>
<%@attribute name="title" fragment="true"%>
<%@attribute name="rightBar" fragment="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><jsp:invoke fragment="title" /></title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/site.css" />
	
	
<link type="text/css" rel="Stylesheet" href="<%=request.getContextPath()%>/css/start/jquery-ui-1.10.3.min.css" />
<link type="text/css" rel="Stylesheet" href="<%=request.getContextPath()%>/css/start/jquery.ui.selectmenu.css" />
<link type="text/css" rel="Stylesheet" href="<%=request.getContextPath()%>/css/start/jquery.steps.css" />
<link type="text/css" rel="Stylesheet" href="<%=request.getContextPath()%>/css/site.css" />

<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.10.2.min.js"> </script>
<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui-1.10.3.min.js"> </script>
<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.ui.selectmenu.js"> </script>
<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.steps.min.js"> </script>
<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.form.min.js"> </script>
<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.validate.min.js"> </script>
<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/pizza.js"> </script>

<jsp:invoke fragment="headContent" />
	
</head>
<body>
  <div id="container">
    <div id="header">
      <img alt="Praego Pizza" src="<%=request.getContextPath()%>/img/title.png"/>
    </div>
    <div id="body">
      <div id="left-border"></div>
      <div id="left-col" class="gradient">
  
      </div>
      <div id="centre-col">

        <jsp:doBody />

      </div>
      <div id="right-col" class="gradient">
  			<jsp:invoke fragment="rightBar" />
      </div>	
      <div id="right-border"></div>
    </div>
  </div>
	
</body>
</html>
