package com.funfit.servlet;

import com.funfit.dao.StudentDAO;
import com.funfit.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updateStudent")
public class UpdateStudentServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Get form parameters
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        int batchId = Integer.parseInt(request.getParameter("batchId"));

        // Create a Student object with the updated details
        Student student = new Student(id, name, email, batchId);

        // Update the student in the database
        try {
            studentDAO.updateStudent(student);
            // Redirect to success page
            response.sendRedirect("success.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            // Redirect to error page
            response.sendRedirect("error.jsp");
        }
    }
}

