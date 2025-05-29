package servlet;

import dao.FeePaymentDAO;
import model.FeePayment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/AddFeePaymentServlet")
public class AddFeePaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String studentID = request.getParameter("studentID");
            String studentName = request.getParameter("studentName");
            String dateStr = request.getParameter("paymentDate");
            double amount = Double.parseDouble(request.getParameter("amount"));
            String status = request.getParameter("status");

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date paymentDate = sdf.parse(dateStr);

            FeePayment fee = new FeePayment();
            fee.setStudentID(studentID);
            fee.setStudentName(studentName);
            fee.setPaymentDate(paymentDate);
            fee.setAmount(amount);
            fee.setStatus(status);

            FeePaymentDAO dao = new FeePaymentDAO();
            dao.insertPayment(fee);

            response.sendRedirect("FeePaymentListServlet");  // Redirect to list servlet
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
