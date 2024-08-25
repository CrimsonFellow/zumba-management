package com.funfit.servlet;

import com.funfit.dao.BatchDAO;
import com.funfit.model.Batch;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/listBatches")
public class GetAllBatchesServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private BatchDAO batchDAO = new BatchDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            // Retrieve all batches from the database
            List<Batch> batches = batchDAO.getAllBatches();
            // Set the batches list as an attribute on the request
            request.setAttribute("batches", batches);
            // Forward the request to the JSP page to display the batches
            request.getRequestDispatcher("listBatches.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            // Redirect to error page
            response.sendRedirect("error.jsp");
        }
    }
}
