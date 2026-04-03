<%
  session.removeAttribute("user-id");
  session.removeAttribute("user-password");
  session.removeAttribute("user-role");
  session.invalidate();
%>
<jsp:forward page="login.jsp"></jsp:forward>
