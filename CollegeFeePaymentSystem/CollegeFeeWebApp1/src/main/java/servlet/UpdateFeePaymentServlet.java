	package servlet;
	
	import dao.FeePaymentDAO;
	import model.FeePayment;
	
	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.*;
	import java.io.IOException;
	import java.text.SimpleDateFormat;
	import java.util.Date;
	
	@WebServlet("/UpdateFeePaymentServlet")
	public class UpdateFeePaymentServlet extends HttpServlet {
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        try {
	            int paymentID = Integer.parseInt(request.getParameter("paymentID"));
	            String studentID = request.getParameter("studentID");  // String
	            String studentName = request.getParameter("studentName");
	            String dateStr = request.getParameter("paymentDate");
	            double amount = Double.parseDouble(request.getParameter("amount"));
	            String status = request.getParameter("status");
	
	            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	            Date paymentDate = sdf.parse(dateStr);
	
	            FeePayment fee = new FeePayment();
	            fee.setPaymentID(paymentID);
	            fee.setStudentID(studentID);
	            fee.setStudentName(studentName);
	            fee.setPaymentDate(paymentDate);
	            fee.setAmount(amount);
	            fee.setStatus(status);
	
	            FeePaymentDAO dao = new FeePaymentDAO();
	            dao.updatePayment(fee);
	
	            response.sendRedirect("feepaymentdisplay.jsp");
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.getWriter().println("Update Error: " + e.getMessage());
	        }
	    }
	}
