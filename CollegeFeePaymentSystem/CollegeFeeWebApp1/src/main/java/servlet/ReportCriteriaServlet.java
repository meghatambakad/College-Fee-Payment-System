package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;

@WebServlet("/ReportCriteriaServlet")
public class ReportCriteriaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String reportType = request.getParameter("reportType");
            String fromDate = request.getParameter("fromDate");
            String toDate = request.getParameter("toDate");

            System.out.println("ReportCriteriaServlet: reportType=" + reportType + ", fromDate=" + fromDate + ", toDate=" + toDate);

            // Validate date inputs if dateRange report type selected
            if ("dateRange".equals(reportType)) {
                if (fromDate == null || fromDate.isEmpty() || toDate == null || toDate.isEmpty()) {
                    // If dates missing, redirect back with error message or handle accordingly
                    response.getWriter().println("Error: Please select both From Date and To Date.");
                    return;
                }
            }

            // Build redirect URL with parameters
            String redirectURL = "ReportServlet?reportType=" + reportType;
            if ("dateRange".equals(reportType)) {
                redirectURL += "&fromDate=" + fromDate + "&toDate=" + toDate;
            }

            response.sendRedirect(redirectURL);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Criteria Error: " + e.getMessage());
        }
    }
}
