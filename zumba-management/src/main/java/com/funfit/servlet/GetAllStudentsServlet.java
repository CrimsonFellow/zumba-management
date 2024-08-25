package com.funfit.servlet;

import com.funfit.dao.StudentDAO;
import com.funfit.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/listStudents")
public class GetAllStudentsServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            // Retrieve all students from the database
            List<Student> students = studentDAO.getAllStudents();
            // Set the students list as an attribute on the request
            request.setAttribute("students", students);
            // Forward the request to the JSP page to display the students
            request.getRequestDispatcher("listStudents.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            // Redirect to error page
            response.sendRedirect("error.jsp");
        }
    }
}
