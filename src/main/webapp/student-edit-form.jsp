<%@page import="com.cemk.controller.StudentDTO"%>
<%@page import="com.cemk.controller.StudentService"%>
<%
  String studentid = request.getParameter("id");
  StudentService studentService = new StudentService();
  StudentDTO studentDTO = studentService.getSingleStudent(studentid);
%>

<form action="student-update.jsp" method="get">
  <div class="form-group">
    <label for="eid">Student ID <span style="color:#5a5e72;font-size:0.6rem;">(read-only)</span></label>
    <input type="text" id="eid" name="id" value="<%=studentDTO.getStudentID()%>" readonly />
  </div>
  <div class="form-group">
    <label for="ename">Full Name</label>
    <input type="text" id="ename" name="name" value="<%=studentDTO.getStudentName()%>" required />
  </div>
  <div class="form-group">
    <label for="eemail">Email Address</label>
    <input type="text" id="eemail" name="email" value="<%=studentDTO.getStudentEmail()%>" required />
  </div>
  <div class="form-group">
    <label for="ecity">City</label>
    <input type="text" id="ecity" name="city" value="<%=studentDTO.getStudentCity()%>" required />
  </div>
  <div class="form-group">
    <label for="eage">Age</label>
    <input type="number" id="eage" name="age" value="<%=studentDTO.getStudentAge()%>" min="1" max="99" required />
  </div>
  <div class="form-divider"></div>
  <div class="form-actions">
    <button type="submit" class="btn-primary"><span>Save Changes &rarr;</span></button>
    <a href="view-all-students.jsp" class="btn-secondary">Cancel</a>
  </div>
</form>
