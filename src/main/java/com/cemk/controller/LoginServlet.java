package com.cemk.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        out.println("GET METHOD");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userId   = request.getParameter("user");
        String userpwd  = request.getParameter("password");
        String userRole = request.getParameter("role");

        UserService  userService  = new UserService();
        UserProfile  userProfile  = new UserProfile();

        userProfile.setUserId(userId);
        userProfile.setUserpwd(userpwd);
        userProfile.setUserRole(userRole);

        boolean flag = userService.validateUser(userProfile);

        // FIX: Removed debug lines:
        //   out.println("NO METHOD")  — was leaking text into every POST response
        //   out.println(" Flag " + flag) — was exposing auth result to the browser

        if (flag) {
            HttpSession session = request.getSession();
            session.setAttribute("user-id",       userId);
            session.setAttribute("user-password", userpwd);
            session.setAttribute("user-role",     userRole);

            ServletContext     context = getServletContext();
            RequestDispatcher  rd      = context.getRequestDispatcher("/home.jsp");
            rd.forward(request, response);
        } else {
            request.setAttribute("message", "Invalid User or Password");

            ServletContext    context = getServletContext();
            RequestDispatcher rd      = context.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
        }
    }
}
