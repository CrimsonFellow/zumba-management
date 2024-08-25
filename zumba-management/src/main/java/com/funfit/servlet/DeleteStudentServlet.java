package com.funfit.servlet;

import com.funfit.dao.StudentDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteStudent")
public class DeleteStudentServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Get the student ID from the form
        int id = Integer.parseInt(request.getParameter("id"));

        // Delete the student from the database
        try {
            studentDAO.deleteStudent(id);
            // Redirect to success page
            response.sendRedirect("success.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            // Redirect to error page
            response.sendRedirect("error.jsp");
        }
    }
}

