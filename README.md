# CEMK Student Portal

Student & User Management System for College of Engineering & Management, Kolaghat.

Built with Java Servlets, JSP, MySQL, and Apache Tomcat.

---

## Tech Stack

- **Backend** — Java 11, Jakarta Servlets, JSP
- **Database** — MySQL 8
- **Server** — Apache Tomcat 10 (via embedded Maven plugin)
- **Build** — Maven (WAR packaging)

---

## Project Structure

```
cemk-portal/
├── src/
│   └── main/
│       ├── java/com/cemk/controller/
│       │   ├── DbConnection.java       # DB connection (reads env vars)
│       │   ├── LoginServlet.java       # Auth servlet
│       │   ├── StudentDTO.java         # Student data model
│       │   ├── StudentService.java     # Student CRUD operations
│       │   ├── UserProfile.java        # User data model
│       │   └── UserService.java        # User validation
│       └── webapp/
│           ├── WEB-INF/
│           │   └── web.xml             # Servlet & app config
│           ├── index.html              # Landing page
│           ├── login.jsp               # Login form
│           ├── home.jsp                # Dashboard (post-login)
│           ├── about-us.jsp
│           ├── contact-us.jsp
│           ├── register-student.jsp
│           ├── view-all-students.jsp
│           ├── edit-student.jsp
│           ├── delete-student.jsp
│           └── logout.jsp
├── pom.xml                             # Maven build config
├── Procfile                            # Railway start command
└── .gitignore
```

---

## Local Development

### Prerequisites
- Java 11+
- Maven 3.6+
- MySQL 8

### 1. Create the database

```sql
CREATE DATABASE cemk_db;
USE cemk_db;

CREATE TABLE user_info (
  user_id   VARCHAR(50) PRIMARY KEY,
  user_pwd  VARCHAR(100) NOT NULL,
  user_role VARCHAR(20) NOT NULL
);

CREATE TABLE student (
  student_id    VARCHAR(50) PRIMARY KEY,
  student_name  VARCHAR(100) NOT NULL,
  student_email VARCHAR(100),
  student_city  VARCHAR(50),
  student_age   INT
);

-- Add a test user
INSERT INTO user_info VALUES ('admin', 'admin123', 'admin');
```

### 2. Set environment variables

**Windows (Command Prompt):**
```cmd
set MYSQL_URL=jdbc:mysql://localhost:3306/cemk_db?useSSL=false&allowPublicKeyRetrieval=true
set MYSQL_USER=root
set MYSQL_PASSWORD=your_password
```

**Mac/Linux:**
```bash
export MYSQL_URL="jdbc:mysql://localhost:3306/cemk_db?useSSL=false&allowPublicKeyRetrieval=true"
export MYSQL_USER=root
export MYSQL_PASSWORD=your_password
```

### 3. Run the app

```bash
mvn tomcat7:run
```

Open `http://localhost:8080` in your browser.

---

## Deploy to Railway

1. Push this repo to GitHub
2. Go to [railway.app](https://railway.app) → New Project → Deploy from GitHub
3. Add a **MySQL** plugin to your Railway project
4. In Railway **Variables**, add:
   - `MYSQL_URL` → copy from Railway MySQL plugin (use the internal URL)
   - `MYSQL_USER` → from Railway MySQL plugin
   - `MYSQL_PASSWORD` → from Railway MySQL plugin
5. Railway will auto-build and deploy using the `Procfile`
6. Run the SQL setup script above in Railway's MySQL console

---

## Environment Variables

| Variable | Description | Example |
|---|---|---|
| `MYSQL_URL` | Full JDBC connection URL | `jdbc:mysql://host:port/db` |
| `MYSQL_USER` | Database username | `root` |
| `MYSQL_PASSWORD` | Database password | `your_password` |
| `PORT` | Server port (set by Railway automatically) | `8080` |

---

## Features

- Secure login with role-based access (Admin, Student, Teacher)
- Full student CRUD — Create, Read, Update, Delete
- Session management with logout
- Responsive dark-themed UI consistent across all pages
