<%@ include file="/config/global.jsp"%>
<%@ include file="/helper/session_helper.jsp"%>
<%
if (UserID != null){
	session.invalidate();
	
	int online_user = 0;
	if (application.getAttribute("app_user_online") == null){
		application.setAttribute("app_user_online", online_user);
	}else{
		online_user = (Integer)application.getAttribute("app_user_online");
		application.setAttribute("app_user_online", online_user - 1);
	}
	
	response.sendRedirect(ROOT_PATH+"index.jsp");
}else{
	response.sendRedirect(ROOT_PATH+"index.jsp");
}
return;
%>