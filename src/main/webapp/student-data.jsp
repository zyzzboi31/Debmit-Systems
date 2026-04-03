<%@page import="java.util.List"%>
<%@page import="com.cemk.controller.StudentDTO"%>
<%@page import="com.cemk.controller.StudentService"%>
<%
  String studentId    = request.getParameter("id");
  String studentName  = request.getParameter("name");
  String studentEmail = request.getParameter("email");
  String studentCity  = request.getParameter("city");
  String studentAge   = request.getParameter("age");

  if (studentId != null && !studentId.isEmpty()) {
    StudentService studentService = new StudentService();
    StudentDTO st = new StudentDTO();
    st.setStudentID(studentId);
    st.setStudentName(studentName);
    st.setStudentEmail(studentEmail);
    st.setStudentCity(studentCity);
    st.setStudentAge(Integer.parseInt(studentAge));
    String message = studentService.registerStudent(st);
    System.out.println("Register message: " + message);
  }
%>
