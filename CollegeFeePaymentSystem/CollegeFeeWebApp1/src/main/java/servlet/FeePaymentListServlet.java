package servlet;


import dao.FeePaymentDAO;
import model.FeePayment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/FeePaymentListServlet")

public class FeePaymentListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FeePaymentDAO dao = new FeePaymentDAO();
        List<FeePayment> payments = dao.selectAllPayments();

        request.setAttribute("paymentsList", payments);
        request.getRequestDispatcher("feepaymentdisplay.jsp").forward(request, response);
    }
}

