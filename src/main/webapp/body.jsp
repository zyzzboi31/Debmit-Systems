<%@ page import="java.util.List"%>
<%@ page import="com.cemk.controller.StudentDTO"%>
<%@ page import="com.cemk.controller.StudentService"%>
<%
  StudentService studentService = new StudentService();
  List<StudentDTO> listOfStudents = studentService.getAllStudents();
  if (listOfStudents == null || listOfStudents.isEmpty()) {
%>
  <tr class="empty-row"><td colspan="6">// No student records found</td></tr>
<%
  } else {
    for (StudentDTO stu : listOfStudents) {
%>
  <tr>
    <td class="id-cell"><%=stu.getStudentID()%></td>
    <td><%=stu.getStudentName()%></td>
    <td><%=stu.getStudentEmail()%></td>
    <td><%=stu.getStudentCity()%></td>
    <td><%=stu.getStudentAge()%></td>
    <td>
      <a href="edit-student.jsp?id=<%=stu.getStudentID()%>" class="action-link edit">Edit</a>
      <a href="delete-student.jsp?id=<%=stu.getStudentID()%>" class="action-link delete"
         onclick="return confirm('Delete student <%=stu.getStudentID()%>?')">Delete</a>
    </td>
  </tr>
<% } } %>
