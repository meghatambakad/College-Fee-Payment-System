<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="dao.FeePaymentDAO, model.FeePayment, java.text.SimpleDateFormat" %>

<%
    String paymentIDStr = request.getParameter("paymentID");
    FeePayment payment = null;
    if (paymentIDStr != null) {
        try {
            int paymentID = Integer.parseInt(paymentIDStr);
            FeePaymentDAO dao = new FeePaymentDAO();
            payment = dao.selectPayment(paymentID);
        } catch (Exception e) {
            out.println("Error fetching payment details: " + e.getMessage());
        }
    }
    if (payment == null) {
%>
    <p style="color: red; font-weight: bold;">Invalid or missing payment ID.</p>
    <a href="feepaymentdisplay.jsp">Back to Payment List</a>
<%
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Update Fee Payment</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }
        .container {
            background: #fff;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            width: 420px;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
            font-weight: 700;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #555;
        }
        input[type="text"], 
        input[type="number"], 
        input[type="date"], 
        select {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 20px;
            border: 1.5px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }
        input[type="text"]:focus,
        input[type="number"]:focus,
        input[type="date"]:focus,
        select:focus {
            border-color: #007BFF;
            outline: none;
        }
        input[type="submit"] {
            width: 100%;
            background-color: #28a745;
            border: none;
            padding: 12px;
            font-size: 18px;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 700;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #1e7e34;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #007BFF;
            text-decoration: none;
            font-weight: 600;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update Fee Payment</h2>
        <form action="UpdateFeePaymentServlet" method="post">
            <input type="hidden" name="paymentID" value="<%= payment.getPaymentID() %>">
            
            <label for="studentID">Student ID:</label>
            <input type="number" id="studentID" name="studentID" value="<%= payment.getStudentID() %>" required>

            <label for="studentName">Student Name:</label>
            <input type="text" id="studentName" name="studentName" value="<%= payment.getStudentName() %>" required>

            <label for="paymentDate">Payment Date:</label>
            <input type="date" id="paymentDate" name="paymentDate" value="<%= new SimpleDateFormat("yyyy-MM-dd").format(payment.getPaymentDate()) %>" required>

            <label for="amount">Amount:</label>
            <input type="number" id="amount" step="0.01" name="amount" value="<%= payment.getAmount() %>" required>

            <label for="status">Status:</label>
            <select id="status" name="status" required>
                <option value="Paid" <%= "Paid".equals(payment.getStatus()) ? "selected" : "" %>>Paid</option>
                <option value="Overdue" <%= "Overdue".equals(payment.getStatus()) ? "selected" : "" %>>Overdue</option>
            </select>

            <input type="submit" value="Update Payment">
        </form>
        <a href="feepaymentdisplay.jsp">Back to Payment List</a>
    </div>
</body>
</html>
