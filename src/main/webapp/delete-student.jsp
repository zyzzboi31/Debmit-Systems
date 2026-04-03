<%@page import="com.cemk.controller.StudentDTO"%>
<%@page import="com.cemk.controller.StudentService"%>
<%
  String studentId = request.getParameter("id");
  StudentService service = new StudentService();
  service.deleteStudent(studentId);
%>
<jsp:forward page="view-all-students.jsp"></jsp:forward>
