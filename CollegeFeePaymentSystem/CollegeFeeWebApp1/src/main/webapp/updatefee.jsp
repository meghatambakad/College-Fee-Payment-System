<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.FeePayment, dao.FeePaymentDAO, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Fee Payment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f4f8;
            margin: 40px;
            color: #333;
        }
        h2 {
            color: #007bff;
            text-align: center;
        }
        form {
            background: white;
            max-width: 500px;
            margin: 20px auto;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        label {
            display: block;
            margin: 15px 0 5px;
            font-weight: 600;
        }
        input[type="text"],
        input[type="date"],
        input[type="number"],
        select {
            width: 100%;
            padding: 8px 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }
        input[type="submit"] {
            margin-top: 20px;
            width: 100%;
            background-color: #007bff;
            color: white;
            font-size: 18px;
            padding: 10px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .error-msg {
            color: red;
            text-align: center;
            font-weight: 600;
            margin: 20px;
        }
        .back-link {
            display: block;
            text-align: center;
            margin: 20px auto;
            font-weight: 600;
            color: #007bff;
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>Update Fee Payment</h2>
    <%
        String paymentIDStr = request.getParameter("paymentID");
        if (paymentIDStr == null || paymentIDStr.trim().isEmpty()) {
    %>
        <p class="error-msg">Invalid or missing payment ID.</p>
        <a href="feepaymentdisplay.jsp" class="back-link">Back to Payment List</a>
    <%
        } else {
            int paymentID = 0;
            try {
                paymentID = Integer.parseInt(paymentIDStr);
            } catch (NumberFormatException e) {
    %>
                <p class="error-msg">Payment ID must be a number.</p>
                <a href="feepaymentdisplay.jsp" class="back-link">Back to Payment List</a>
    <%
                return;
            }
            FeePaymentDAO dao = new FeePaymentDAO();
            FeePayment fee = dao.selectPayment(paymentID);
            if (fee == null) {
    %>
                <p class="error-msg">No payment found for ID <%= paymentID %>.</p>
                <a href="feepaymentdisplay.jsp" class="back-link">Back to Payment List</a>
    <%
            } else {
    %>
        <form action="UpdateFeePaymentServlet" method="post">
            <input type="hidden" name="paymentID" value="<%= fee.getPaymentID() %>">

            <label for="studentID">Student ID:</label>
            <input type="text" id="studentID" name="studentID" value="<%= fee.getStudentID() %>" required>

            <label for="studentName">Student Name:</label>
            <input type="text" id="studentName" name="studentName" value="<%= fee.getStudentName() %>" required>

            <label for="paymentDate">Payment Date:</label>
            <input type="date" id="paymentDate" name="paymentDate" value="<%= new SimpleDateFormat("yyyy-MM-dd").format(fee.getPaymentDate()) %>" required>

            <label for="amount">Amount:</label>
            <input type="number" step="0.01" id="amount" name="amount" value="<%= fee.getAmount() %>" required>

            <label for="status">Status:</label>
            <select id="status" name="status" required>
                <option value="Paid" <%= "Paid".equals(fee.getStatus()) ? "selected" : "" %>>Paid</option>
                <option value="Pending" <%= "Pending".equals(fee.getStatus()) ? "selected" : "" %>>Pending</option>
                <option value="Overdue" <%= "Overdue".equals(fee.getStatus()) ? "selected" : "" %>>Overdue</option>
            </select>

            <input type="submit" value="Update Payment">
        </form>
        <a href="feepaymentdisplay.jsp" class="back-link">Back to Payment List</a>
    <%
            }
        }
    %>
</body>
</html>
