package servlet;



import dao.FeePaymentDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;

@WebServlet("/DeleteFeePaymentServlet")
public class DeleteFeePaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int paymentID = Integer.parseInt(request.getParameter("paymentID"));

            FeePaymentDAO dao = new FeePaymentDAO();
            dao.deletePayment(paymentID);

            // Redirect to display after deletion
            response.sendRedirect("feepaymentdisplay.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Delete Error: " + e.getMessage());
        }
    }
}

