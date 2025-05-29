package servlet;

import dao.FeePaymentDAO;
import model.FeePayment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String reportType = request.getParameter("reportType");
            String fromDateStr = request.getParameter("fromDate");
            String toDateStr = request.getParameter("toDate");

            System.out.println("ReportServlet: reportType=" + reportType + ", fromDate=" + fromDateStr + ", toDate=" + toDateStr);

            FeePaymentDAO dao = new FeePaymentDAO();
            List<FeePayment> result = new ArrayList<>();

            if ("overdue".equals(reportType)) {
                result = dao.selectOverduePayments();
            } else if ("dateRange".equals(reportType)) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date fromDate = sdf.parse(fromDateStr);
                Date toDate = sdf.parse(toDateStr);
                result = dao.selectPaymentsByDateRange(fromDate, toDate);
            } else {
                System.out.println("Unknown report type: " + reportType);
            }

            System.out.println("Number of records fetched: " + result.size());

            request.setAttribute("reportResults", result);
            request.getRequestDispatcher("report_result.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Report Error: " + e.getMessage());
        }
    }
}
