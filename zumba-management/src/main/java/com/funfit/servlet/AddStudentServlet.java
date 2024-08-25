package com.funfit.servlet;

import com.funfit.dao.StudentDAO;
import com.funfit.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addStudent")
public class AddStudentServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Get form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        int batchId = Integer.parseInt(request.getParameter("batchId"));

        // Create a new Student object
        Student student = new Student(name, email, batchId);

        // Add the student to the database
        try {
            studentDAO.addStudent(student);
            // Redirect to success page
            response.sendRedirect("success.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            // Redirect to error page
            response.sendRedirect("error.jsp");
        }
    }
}
