<%@page import="com.cemk.controller.StudentDTO"%>
<%@page import="com.cemk.controller.StudentService"%>
<%
  String studentId    = request.getParameter("id");
  String studentName  = request.getParameter("name");
  String studentEmail = request.getParameter("email");
  String studentCity  = request.getParameter("city");
  String studentAge   = request.getParameter("age");

  StudentService studentService = new StudentService();
  StudentDTO dto = new StudentDTO();
  dto.setStudentID(studentId);
  dto.setStudentName(studentName);
  dto.setStudentEmail(studentEmail);
  dto.setStudentCity(studentCity);
  dto.setStudentAge(Integer.parseInt(studentAge));
  String message = studentService.updateStudent(dto);
%>
<%-- Forward back to all students; message can be shown via request attribute if needed --%>
<jsp:forward page="view-all-students.jsp"></jsp:forward>
